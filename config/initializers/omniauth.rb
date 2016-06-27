Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '146759255732430', '242dc8c8407c5c188474c7ac82896bba'
end
