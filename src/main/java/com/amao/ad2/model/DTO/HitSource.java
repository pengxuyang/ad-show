package com.amao.ad2.model.DTO;

/**
 * Created by Amao on 5/25/2016.
 */
public class HitSource {
	private String url;
	private int hit;
	private double percent;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public double getPercent() {
		return percent;
	}

	public void setPercent(double percent) {
		this.percent = percent;
	}
}
