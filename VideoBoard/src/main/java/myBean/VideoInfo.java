package myBean;

public class VideoInfo {
	private String title;
	private String video_src;
	private String thumbnail_src;
	private String explanation;
	public VideoInfo() {
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title; 
	}
	public String getVideo_src() {
		return video_src;
	}
	public void setVideo_src(String video_src) {
		this.video_src = video_src;
	}
	public String getThumbnail_src() {
		return thumbnail_src;
	}
	public void setThumbnail_src(String thumbnail_src) {
		this.thumbnail_src = thumbnail_src;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	private String category;
}