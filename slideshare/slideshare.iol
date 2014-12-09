
/** For Slideshare API **/

/** For get_slideshow **/
type slideshowAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.slideshow_id*:string
	.slideshow_url*:string
	.username*:string
	.password*:string
	.exclude_tags*:string // 1 to exclude tags
	.detailed*:string // 1 to include optional information, 0 (default) for basic
}

/** For get_slideshows_by_tag **/
type slideshowsByTagAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.tag:string
	.limit*:string
	.offset*:string
	.detailed*:string
}

/** For get_slideshows_by_group **/
type slideshowsByGroupAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.group_name:string
	.limit*:string
	.offset*:string
	.detailed*:string
}

/** For get_slideshows_by_user **/
type slideshowsByUserAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username_for:string
	.username*:string
	.password*:string
	.limit*:string
	.offset*:string
	.detailed*:string
	.get_unconverted*:string // Whether or not to include unconverted slideshows. 1 to include them, 0 (default) otherwise.
}

/* For search_slideshows */
type searchSlideshowsAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.q:string //query string
	.page*:string
	.items_per_page*:string
	.lang*:string
	.sort*:string
	.upload_date*:string
	.what*:string
	.download*:string
	.fileformat*:string
	.file_type*:string
	.cc*:string
	.cc_adapt*:string
	.cc_commercial*:string
	.detailed*:string
}

/** For get_user_groups **/
type getUserGroupsAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username_for:string
	.username*:string
	.password*:string
}

/** For get_user_favorites **/
type getUserFavoritesAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username_for:string
}

/** For get_user_contacts **/
type getUserContactsAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username_for:string
	.limit*:string
	.offset*:string
}

/** For get_users_tags **/
type getUserTagsAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string
}

/** For edit_slideshow **/
type editSlideshowAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string
	.slideshow_id:string
	.slideshow_title*:string
	.slideshow_description*:string
	.slideshow_tags*:string
	.make_slideshow_private*:string
	.generate_secret_url*:string
}

/** For delete_slideshow **/
type deleteSlideshowAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string
	.slideshow_id:string
}

/** For upload_slideshow **/
type uploadSlideshowAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	// Required parameters
	.username:string
	.password:string
	.slideshow_title:string
	.slideshow_srcfile*:string // OR
	.upload_url*:string

	// Optional parameters
	.slideshow_description*:string
	.slideshow_tags*:string
	.make_src_public*:string

	// Privacy settings (optional)
	.make_slideshowprivate*:string
	.generate_secret_url*:string
	.allow_embeds*:string
	.share_with_contacts*:string
}

/** For add_favorite **/
type addFavoriteAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string
	.slideshow_id:string
}

/** For check_favorite **/
type checkFavoriteAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string
	.slideshow_id:string
}

/** For get_user_campaigns **/
type getUserCampaignsAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string
}

/** For get_user_leads **/
type getUserLeadsAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string

	.begin*:string // only get leads collected after this UTC date: YYYYMMDDHHMM
	.end*:string // only get leads collected before this UTC date: YYYYMMDDHHMM
}

/** For get_user_campaing_leads **/
type getUserCampaignLeadsAPIType:void {
	.api_key:string
	.hash:string
	.ts:string
	.username:string
	.password:string
	.campaign_id:string

	.begin*:string
	.end*:string
}

interface SlideshareInterface {
RequestResponse:
	get_slideshow(slideshowAPIType)(undefined),
	get_slideshows_by_tag(slideshowsByTagAPIType)(undefined),
	get_slideshows_by_group(slideshowsByGroupAPIType)(undefined),
	get_slideshows_by_user(slideshowsByUserAPIType)(undefined),
	search_slideshows(searchSlideshowsAPIType)(undefined),
	get_user_groups(getUserGroupsAPIType)(undefined),
	get_user_favorites(getUserFavoritesAPIType)(undefined),
	get_user_contacts(getUserContactsAPIType)(undefined),
	get_user_tags(getUserTagsAPIType)(undefined),
	edit_slideshow(editSlideshowAPIType)(undefined),
	delete_slideshow(deleteSlideshowAPIType)(undefined),
	upload_slideshow(uploadSlideshowAPIType)(undefined),
	add_favorite(addFavoriteAPIType)(undefined),
	check_favorite(checkFavoriteAPIType)(undefined),
	get_user_campaigns(getUserCampaignsAPIType)(undefined),
	get_user_leads(getUserLeadsAPIType)(undefined),
	get_user_campaign_leads(getUserCampaignLeadsAPIType)(undefined)
}

/** For library **/
type slideshowByIDLibType:void {
	.slideshow_id:string
	.username*:string
	.password*:string
	.exclude_tags*:string // 1 to exclude tags
	.detailed*:string // 1 to include optional information, 0 (default) for basic

}

type slideshowByURLLibType:void {
	.slideshow_url:string

	// Optional
	.username*:string
	.password*:string
	.exclude_tags*:string // 1 to exclude tags
	.detailed*:string // 1 to include optional information, 0 (default) for basic
}

type slideshowsByTagLibType:void {
	.tag:string

	// Optional
	.limit*:string
	.offset*:string
	.detailed*:string
}

/** For get_slideshows_by_group **/
type slideshowsByGroupLibType:void {
	.group_name:string
	.limit*:string
	.offset*:string
	.detailed*:string
}

/** For get_slideshows_by_user **/
type slideshowsByUserLibType:void {
	.username_for:string
	.username*:string
	.password*:string
	.limit*:string
	.offset*:string
	.detailed*:string
	.get_unconverted*:string // Whether or not to include unconverted slideshows. 1 to include them, 0 (default) otherwise.
}

/* For search_slideshows */
type searchSlideshowsLibType:void {
	.q:string //query string
	.page*:string
	.items_per_page*:string
	.lang*:string
	.sort*:string
	.upload_date*:string
	.what*:string
	.download*:string
	.fileformat*:string
	.file_type*:string
	.cc*:string
	.cc_adapt*:string
	.cc_commercial*:string
	.detailed*:string
}

/** For get_user_groups **/
type getUserGroupsLibType:void {
	.username_for:string
	.username*:string
	.password*:string
}

/** For get_user_favorites **/
type getUserFavoritesLibType:void {
	.username_for:string
}

/** For get_user_contacts **/
type getUserContactsLibType:void {
	.username_for:string
	.limit*:string
	.offset*:string
}

/** For get_users_tags **/
type getUserTagsLibType:void {
	.username:string
	.password:string
}

/** For edit_slideshow **/
type editSlideshowLibType:void {
	.username:string
	.password:string
	.slideshow_id:string
	.slideshow_title*:string
	.slideshow_description*:string
	.slideshow_tags*:string
	.make_slideshow_private*:string
	.generate_secret_url*:string
}

/** For delete_slideshow **/
type deleteSlideshowLibType:void {
	.username:string
	.password:string
	.slideshow_id:string
}

/** For upload_slideshow **/
type uploadSlideshowBySrcFileLibType:void {
	// Required parameters
	.username:string
	.password:string
	.slideshow_title:string
	.slideshow_srcfile:string 

	// Optional parameters
	.slideshow_description*:string
	.slideshow_tags*:string
	.make_src_public*:string

	// Privacy settings (optional)
	.make_slideshowprivate*:string
	.generate_secret_url*:string
	.allow_embeds*:string
	.share_with_contacts*:string
}

type uploadSlideshowByURLLibType:void {
	// Required parameters
	.username:string
	.password:string
	.slideshow_title:string
	.upload_url:string

	// Optional parameters
	.slideshow_description*:string
	.slideshow_tags*:string
	.make_src_public*:string

	// Privacy settings (optional)
	.make_slideshowprivate*:string
	.generate_secret_url*:string
	.allow_embeds*:string
	.share_with_contacts*:string
}

/** For add_favorite **/
type addFavoriteLibType:void {
	.username:string
	.password:string
	.slideshow_id:string
}

/** For check_favorite **/
type checkFavoriteLibType:void {
	.username:string
	.password:string
	.slideshow_id:string
}

/** For get_user_campaigns **/
type getUserCampaignsLibType:void {
	.username:string
	.password:string
}

/** For get_user_leads **/
type getUserLeadsLibType:void {
	.username:string
	.password:string

	.begin*:string // only get leads collected after this UTC date: YYYYMMDDHHMM
	.end*:string // only get leads collected before this UTC date: YYYYMMDDHHMM
}

/** For get_user_campaing_leads **/
type getUserCampaignLeadsLibType:void {
	.username:string
	.password:string
	.campaign_id:string

	.begin*:string
	.end*:string
}

interface SlideshareLibraryInterface {
	RequestResponse:
		GetSlideshowByID(slideshowByIDLibType)(undefined),
		GetSlideshowByURL(slideshowByURLLibType)(undefined),
		GetSlideshowsByTag(slideshowsByTagLibType)(undefined),
		GetSlideshowsByGroup(slideshowsByGroupLibType)(undefined),
		GetSlideshowsByUser(slideshowsByUserLibType)(undefined),
		SearchSlideshows(searchSlideshowsLibType)(undefined),
		GetUserGroups(getUserGroupsLibType)(undefined),
		GetUserFavorites(getUserFavoritesLibType)(undefined),
		GetUserContacts(getUserContactsLibType)(undefined),
		GetUserTags(getUserTagsLibType)(undefined),
		EditSlideshow(editSlideshowLibType)(undefined),
		DeleteSlideshow(deleteSlideshowLibType)(undefined),
		UploadSlideshowBySrcFile(uploadSlideshowBySrcFileLibType)(undefined),
		UploadSlideshowByURL(uploadSlideshowByURLLibType)(undefined),
		AddFavorite(addFavoriteLibType)(undefined),
		CheckFavorite(checkFavoriteLibType)(undefined),
		GetUserCampaigns(getUserGroupsLibType)(undefined),
		GetUserLeads(getUserLeadsLibType)(undefined),
		GetUserCampaignLeads(getUserCampaignLeadsLibType)(undefined)
}

