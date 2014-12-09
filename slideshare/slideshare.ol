include "slideshare.iol"
include "time.iol"
include "string_utils.iol"
include "console.iol"

execution { concurrent }

interface SHAInterface {
RequestResponse:
	sha(undefined)(undefined) throws NoSuchAlgorithmException
}

outputPort SHA {
	Interfaces: SHAInterface
}

inputPort SlideshareLibrary {
	Location: "socket://localhost:8000/"
	Protocol: http
	Interfaces: SlideshareLibraryInterface
}
embedded {
	Java:
		"SHA1" in SHA
}

outputPort Slideshare {
	Location: "socket://www.slideshare.net:443/api/2/"
	Protocol: https {
		.method = "get";
		.ssl.protocol = "TLSv1";
		.debug = true;
		.debug.showContent = true
//		.osc.get_slideshow.alias = "get_slideshow?slideshow_url=%!{slideshow_url}&ts=%{ts}&hash=%{hash}&api_key=%{api_key}"
	}
	Interfaces: SlideshareInterface
}

init {
	APIKEY = "EsFj0JBb";
	SHAREDSECRET = "uPn4meMm"
}

define calcTimeAndHash {
	getCurrentTimeMillis@Time()(ts);
	ts = int(ts/1000);
	s.sha = SHAREDSECRET+ts;
	sha@SHA(s)(hash);
	with(request) {
		.api_key = APIKEY;
		.ts = string(ts);
		.hash = hash
	}
}

main {

	[GetSlideshowByID(request)(response) {

		calcTimeAndHash;

		request.slideshow_id = request.slideshow_id;

		get_slideshow@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetSlideshowByURL(request)(response) {
		calcTimeAndHash;
		
		request.slideshow_url = request.slideshow_url;
		
		get_slideshow@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetSlideshowsByTag(request)(response) {
		calcTimeAndHash;

		request.tag = request.tag;

		get_slideshows_by_tag@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetSlideshowsByGroup(request)(response) {
		calcTimeAndHash;

		request.group_name = request.group_name;

		get_slideshows_by_group@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetSlideshowsByUser(request)(response) {
		calcTimeAndHash;

		request.username_for = request.username_for;

		get_slideshows_by_user@Slideshare(request)(response)
	}
	] { nullProcess }

	[SearchSlideshows(request)(response) {
		calcTimeAndHash;

		request.q = request.q;

		search_slideshows@Slideshare(request)(response)
	}
	] { nullProcess }
	
	[GetUserGroups(request)(response) {
		calcTimeAndHash;

		request.username_for = request.username_for;

		get_user_groups@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetUserFavorites(request)(response) {
		calcTimeAndHash;

		request.username_for = request.username_for;

		get_user_favorites@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetUserContacts(request)(response) {
		calcTimeAndHash;

		request.username_for = request.username_for;

		get_user_contacts@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetUserTags(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password
		};

		get_user_tags@Slideshare(request)(response)
	}
	] { nullProcess }

	[EditSlideshow(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password;
			.slideshow_id = request.slideshow_id
		};

		edit_slideshow@Slideshare(request)(response)
	}
	] { nullProcess }

	/*** REQUIRES POST
	!!! NOT YET IMPLEMENTED !!! ***/
	[UploadSlideshowBySrcFile(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password;
			.slideshow_title = request.slideshow_title;
			.slideshow_srcfile = request.slideshow_srcfile
		};

		upload_slideshow@Slideshare(request)(response)
	}
	] { nullProcess }

	[UploadSlideshowByURL(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password;
			.slideshow_title = request.slideshow_title;
			.upload_url = request.upload_url
		};

		upload_slideshow@Slideshare(request)(response)
	}
	] { nullProcess }

	[AddFavorite(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password;
			.slideshow_id = request.slideshow_id
		};

		add_favorite@Slideshare(request)(response)
	}
	] { nullProcess }

	[CheckFavorite(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password;
			.slideshow_id = request.slideshow_id
		};

		check_favorite@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetUserCampaigns(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password
		};

		get_user_campaigns@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetUserLeads(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password
		};

		get_user_leads@Slideshare(request)(response)
	}
	] { nullProcess }

	[GetUserCampaignLeads(request)(response) {
		calcTimeAndHash;

		with(request) {
			.username = request.username;
			.password = request.password;
			.campaign_id = campaign_id
		};

		get_user_campaign_leads@Slideshare(request)(response) 
	}
	] { nullProcess }


}
