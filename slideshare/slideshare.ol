include "slideshare.iol"
include "time.iol"
include "string_utils.iol"
include "console.iol"

interface SHAInterface {
RequestResponse:
	sha(undefined)(undefined) throws NoSuchAlgorithmException
}

outputPort SHA {
	Interfaces: SHAInterface
}

inputPort SlideShareLibrary {
	Location: "socket://localhost:8000/"
	Protocol: http
	Interfaces: SlideShareLibraryInterface
}
embedded {
	Java:
		"HashTextTest" in SHA
}



main {

	[GetSlideShow(req)(resp) {
		req.api_key = "EsFj0JBb";
		getCurrentTimeMillis@Time()(ts);
		substring = ""+ts;
		length@StringUtils(substring)(length);
		substring.end = length-3;
		substring.begin = 0;
		substring@StringUtils(substring)(req.ts);
		
		s.sha = "uPn4meMm"+req.ts;
		sha@SHA(s)(req.hash);
		
		get_slideshow@SlideShare(req)(resp);

		println@Console("Did I get here?")()
	}
	] { nullProcess }

}
