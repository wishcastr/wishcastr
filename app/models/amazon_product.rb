require 'time'
require 'openssl'
require 'base64'
require 'nokogiri'
require 'open-uri'

class AmazonProduct < Product

  ENDPOINT = "webservices.amazon.com"
  REQUEST_URI = "/onca/xml"

  # See this resource:
  #  http://webservices.amazon.com/scratchpad/index.html#http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&Operation=ItemSearch&SubscriptionId=AKIAJ64U7F3OSBNH7ERQ&AssociateTag=wishcastr-20&SearchIndex=All&Keywords=nintendo wii&ResponseGroup=Images,ItemAttributes,ItemIds,OfferSummary
  def self.generate_amazon_uri(query, operation = "ItemSearch")
    key = ENV['AWS_ACCESS_KEY_ID']
    secret = ENV['AWS_SECRET_ACCESS_KEY']
    tag = "wishcastr-20"
    params = {}

    # The region you are interested in
    if operation == "ItemSearch"
      params = {
        "Service" => "AWSECommerceService",
        "Operation" => operation,
        "AWSAccessKeyId" => key,
        "AssociateTag" => tag,
        "SearchIndex" => "All",
        "Keywords" => query,
        "ResponseGroup" => "Images,ItemAttributes,ItemIds,OfferListings,Offers"
      }
    elsif operation == "ItemLookup"
      params = {
        "Service" => "AWSECommerceService",
        "Operation" => operation,
        "AWSAccessKeyId" => key,
        "AssociateTag" => tag,
        "ItemId" => query,
        "IdType" => "ASIN",
        "ResponseGroup" => "Images,ItemAttributes,Offers"
      }
    end

    # Set current timestamp if not set
    params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")

    # Generate the canonical query
    canonical_query_string = params.sort.collect do |key, value|
      [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
    end.join('&')

    # Generate the string to be signed
    string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"

    # Generate the signature required by the Product Advertising API
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret, string_to_sign)).strip()

    # Generate the signed URL
    request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"

    # logger.debug("Signed URL: \"#{request_url}\"")
    return request_url
  end

  def self.search(query)
    doc = Nokogiri.XML(open(generate_amazon_uri(query, "ItemSearch")))
    doc.remove_namespaces!

    search_results = []
    # logger.debug(doc)

    doc.xpath("/ItemSearchResponse[1]/Items[1]/Item").each do |item|
      # logger.debug(item)
      result = {}

      result[:id] = nil
      result[:type] = "AmazonProduct"
      result[:sku] = item.xpath("ASIN[1]").text
      result[:image_large] = item.xpath("LargeImage[1]/URL[1]").text || ""
      result[:image_thumbnail] = item.xpath("ImageSets[1]/ImageSet[1]/TinyImage[1]/URL[1]").text || ""
      result[:title] = item.xpath("ItemAttributes[1]/Title[1]").text.titleize
      result[:brand] = item.xpath("ItemAttributes[1]/Brand[1]").text || ""
      result[:current_price] = item.xpath("OfferSummary[1]/LowestNewPrice[1]/Amount[1]").text.to_f/100
      result[:current_price] = "Not Available" unless result[:current_price]
      result[:description] = item.xpath("ItemAttributes[1]/Edition[1]").text || "No Description"
      result[:affiliate_url] = item.xpath("DetailPageURL[1]").text
      item.xpath("ItemAttributes[1]/Feature").each do |feature|
        the_feature = feature.text
        the_feature.prepend("\n") unless result[:description].blank?
        result[:description] += the_feature
      end

      search_results << result
    end
    search_results
  end

  def self.item_lookup(sku)
    doc = Nokogiri.XML(open(generate_amazon_uri(sku, "ItemLookup")))
    doc.remove_namespaces!

    product = {}

    item = doc.xpath("/ItemLookupResponse[1]/Items[1]/Item[1]")

    product[:id] = nil
    product[:type] = "AmazonProduct"
    product[:sku] = item.xpath("ASIN[1]").text
    product[:image_large] = item.xpath("LargeImage[1]/URL[1]").text || ""
    product[:title] = item.xpath("ItemAttributes[1]/Title[1]").text.titleize
    product[:brand] = item.xpath("ItemAttributes[1]/Brand[1]").text || ""
    product[:current_price] = item.xpath("OfferSummary[1]/LowestNewPrice[1]/Amount[1]").text.to_f/100
    product[:current_price] = "Not Available" unless product[:current_price]
    product[:description] = item.xpath("ItemAttributes[1]/Edition[1]").text || "No Description"
    product[:affiliate_url] = item.xpath("DetailPageURL[1]").text
    item.xpath("ItemAttributes[1]/Feature").each do |feature|
      the_feature = feature.text
      the_feature.prepend("\n") unless result[:description].blank?
      product_result[:description] += the_feature
    end
    product
  end

end
