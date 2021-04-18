Rails.application.config.content_security_policy do  |p|
    p.default_src :self, :https
    p.font_src    :self, :https
    # p.img_src     :self , :https
    p.object_src  :none
    p.script_src  :self, :https, :unsafe_inline
    p.style_src   :self, :https, :unsafe_inline
    p.img_src :self, :https
    # p.img_src :self, 'power.itp.ac.cn', :https
    # p.img_src 'power.itp.ac.cn'
    # p.img_src :none
    # p.img_src :self
    # Specify URI for violation reports
    p.report_uri  "/violation_report"
end