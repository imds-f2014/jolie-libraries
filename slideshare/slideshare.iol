

type slideshowType:void {
	.slideshow_url:string
	.api_key:string
	.hash:string
	.ts:string
}

type slideShowReqType:void {
	.slideshow_url:string
}

interface SlideShareInterface {
RequestResponse:
	get_slideshow(slideshowType)(undefined)
}

interface SlideShareLibraryInterface {
	RequestResponse:
		GetSlideShow(slideShowReqType)(undefined)
}

outputPort SlideShare {
	Location: "socket://www.slideshare.net:443/api/2/"
	Protocol: https {
		.method = "get";
		.addHeader.header[0] = "User-Agent";
		.addHeader.header[0].value = "Blah";
		.ssl.protocol = "TLSv1.2";
		.debug = true;
		.debug.showContent = true;
		.cookies.cookie.cookieConfig.secure = 1;
		.osc.get_slideshow.alias = "get_slideshow?slideshow_url=%!{slideshow_url}&ts=%!{ts}&hash=%!{hash}&api_key=%!{api_key}"
	}
	Interfaces: SlideShareInterface
}
