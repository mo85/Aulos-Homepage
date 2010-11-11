# encoding: utf-8
module CaptchaHelper
  # is skip captcha
  def captcha_skip?
    if session[:captcha_skip] == true
      true
    else
      false
    end
  end

  def captcha_image(options = {})
    @captcha_image ||= CaptchaUtil::random_image
    image_tag('/system/captcha/' + @captcha_image, options)
  end

  def captcha_input_text(label, options = {})
    @captcha_image ||= CaptchaUtil::random_image
    content_tag('label', label, :for => 'captcha') + text_field_tag(:captcha, nil, options)
  end

  def captcha_hidden_text
    @captcha_image ||= CaptchaUtil::random_image
    hidden_field_tag(:captcha_validation, @captcha_image.gsub(/\..+$/,''))
  end

  def captcha_block(label = 'Sicherheitsprüfung')
    content_tag('div', captcha_hidden_text + captcha_image + captcha_input_text(label), { :class => 'captcha' })
  end
   
end

