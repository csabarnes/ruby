# for backward compatibility

# :enddoc:

class Net::HTTP
  ProxyMod = ProxyDelta
  HTTPSession = self
end

module Net::NetPrivate
  HTTPRequest = ::Net::HTTPRequest
end

Net::HTTPInformationCode  = Net::HTTPInformation
Net::HTTPSuccessCode      = Net::HTTPSuccess
Net::HTTPRedirectionCode  = Net::HTTPRedirection
Net::HTTPRetriableCode    = Net::HTTPRedirection
Net::HTTPClientErrorCode  = Net::HTTPClientError
Net::HTTPFatalErrorCode   = Net::HTTPClientError
Net::HTTPServerErrorCode  = Net::HTTPServerError
Net::HTTPResponceReceiver = Net::HTTPResponse

