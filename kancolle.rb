# -*- coding: utf-8 -*-
require "webkit-gtk2"

Plugin.create(:kancolle) do
  nakachan = File.join(File.dirname(__FILE__), 'nakachan.png').freeze

  tab(:kancolle, "艦これ") do
    set_icon nakachan
    view = WebKitGtk2::WebView.new
    view.load_uri("http://www.dmm.com/netgame/feature/kancolle.html")
    nativewidget view.show_all
  end

  filter_web_image_loader_url_filter do |url|
    if url.include? 'toshia.dip.jp'
      [url]
    else
      [nakachan] end end
end
