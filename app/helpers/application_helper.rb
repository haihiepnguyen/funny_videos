module ApplicationHelper
  include Pagy::Frontend

  def youtube_id(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    youtube_id
  end

  def youtube_embed(youtube_url)
    %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id(youtube_url) }" frameborder="0" allowfullscreen></iframe>}
  end

  def like_svg
    %Q{<svg width="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><defs><style>.a{fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;}</style></defs><title>like-1</title><path class="a" d="M20,15.659h0a1.5,1.5,0,1,1,0,3H19a1.5,1.5,0,0,1,1.5,1.5c0,.829-.672,1-1.5,1H12.5c-2.851,0-3.5-.5-7-1v-8.5c2.45,0,6.5-4.5,6.5-8.5,0-1.581,2.189-2.17,3,.719.5,1.781-1,5.281-1,5.281h8a1.5,1.5,0,0,1,1.5,1.5c0,.829-.672,2-1.5,2H21a1.5,1.5,0,0,1,0,3H20"/><rect class="a" x="0.5" y="10.159" width="5" height="12"/><path d="M3.25,19.159a.75.75,0,1,0,.75.75.75.75,0,0,0-.75-.75Z"/></svg>}
  end

  def like_voted_svg
    %Q{<svg width="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><defs><style>.a{fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;}</style></defs><title>like-1</title><path class="" d="M20,15.659h0a1.5,1.5,0,1,1,0,3H19a1.5,1.5,0,0,1,1.5,1.5c0,.829-.672,1-1.5,1H12.5c-2.851,0-3.5-.5-7-1v-8.5c2.45,0,6.5-4.5,6.5-8.5,0-1.581,2.189-2.17,3,.719.5,1.781-1,5.281-1,5.281h8a1.5,1.5,0,0,1,1.5,1.5c0,.829-.672,2-1.5,2H21a1.5,1.5,0,0,1,0,3H20" id="id_101" fill="#3e5559"/><rect class="" x="0.5" y="10.159" width="5" height="12" id="id_102" fill="#3f575c"/><path d="M3.25,19.159a.75.75,0,1,0,.75.75.75.75,0,0,0-.75-.75Z" id="id_103" class="" fill="#b8b8b8"/></svg>}
  end

  def dislike_svg
    %Q{<svg width="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64"><title>1</title><g id="Layer_77" data-name="Layer 77"><path d="M61.7,31.82l-6-17.75A9.73,9.73,0,0,0,46.37,7.2H25.23A2,2,0,0,0,24,7.65l-2.47,2A4.8,4.8,0,0,0,17.22,7H6.81A4.81,4.81,0,0,0,2,11.81v27a4.81,4.81,0,0,0,4.81,4.81H17.22A4.8,4.8,0,0,0,22,39.19h2.11l7.34,15A4.43,4.43,0,0,0,35.57,57h4.05A4.41,4.41,0,0,0,44,52.75a2,2,0,0,0,0-.35L42.32,40H55.72a6.28,6.28,0,0,0,6-8.2ZM18,38.84a.81.81,0,0,1-.81.81H6.81A.81.81,0,0,1,6,38.84v-27A.81.81,0,0,1,6.81,11H17.22a.81.81,0,0,1,.81.81v27Zm39.52-3.75a2.26,2.26,0,0,1-1.84.93H40a2,2,0,0,0-2,2.27L40,52.7a.42.42,0,0,1-.4.3H35.57a.42.42,0,0,1-.4-.28,1.94,1.94,0,0,0-.08-.2L27.15,36.3a2,2,0,0,0-1.8-1.12H22V14.4l3.92-3.2H46.37a5.76,5.76,0,0,1,5.52,4.1l6,17.75A2.26,2.26,0,0,1,57.55,35.08Z"/><circle cx="11.57" cy="17.02" r="3.55"/></g></svg>}
  end

  def dislike_voted_svg
    %Q{<svg width="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
<style type="text/css">
	.st0{fill:#01A0C6;}
	.st1{fill:#FF0000;}
</style>
<g id="Layer_4">
	<rect x="57.3" y="30.5" class="st0" width="97.1" height="285.5"/>
	<path class="st0" d="M182,300V65.3h222.5c0,0,60.9,19.6,32.6,68.1c0,0,66.8,21.9,26.8,69.2c0,0,67.7,27.4,10.1,77.2   c0,0,52.3,53.6-16.6,79H327.6c0,0,26.8,167.4-81.9,137.7l2.2-76.1C247.9,420.3,232.7,382.6,182,300z"/>
</g>
<g id="Layer_3">
	<rect x="14.9" y="31.3" class="st1" width="97.1" height="285.5"/>
	<path class="st1" d="M139.5,300.9V66.1H362c0,0,60.9,19.6,32.6,68.1c0,0,66.8,21.9,26.8,69.2c0,0,67.7,27.4,10.1,77.2   c0,0,52.3,53.6-16.6,79H285.2c0,0,26.8,167.4-81.9,137.7l2.2-76.1C205.4,421.1,190.2,383.5,139.5,300.9z"/>
</g>
<g id="Layer_2">
	<rect x="32.6" y="31.3" width="97.1" height="285.5"/>
	<path d="M157.2,300.9V66.1h222.5c0,0,60.9,19.6,32.6,68.1c0,0,66.8,21.9,26.8,69.2c0,0,67.7,27.4,10.1,77.2c0,0,52.3,53.6-16.6,79   H302.8c0,0,26.8,167.4-81.9,137.7l2.2-76.1C223.1,421.1,207.9,383.5,157.2,300.9z"/>
</g>
</svg>}
  end
end
