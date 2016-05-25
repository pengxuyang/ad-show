package com.amao.ad2.core;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

import com.amao.ad2.model.DTO.HitSource;
import org.springframework.stereotype.Service;

/**
 * @author Amao
 * @since 2016-05-25
 */
@Service
public class ShowService {
	private static final List<String> HIT_URLS = loadHitUrls();

	private static List<String> loadHitUrls() {
		final List<String> list = new ArrayList<>();
		try (Scanner scanner = new Scanner(ShowService.class.getResourceAsStream("/urls.txt"))){
			while (scanner.hasNext()) {
				final String url = scanner.nextLine();
				list.add(url);
			}
		}
		return list;
	}


	public List<HitSource> getHitSources() {
		List<String> urls = new ArrayList<>(HIT_URLS);
		Collections.shuffle(urls);
		if (urls.size() > 10) { //TODO: magic number
			urls = urls.subList(0, 10);
		}

		int size = urls.size();
		final List<HitSource> hitSources = new ArrayList<>(size);
		if( size == 0 ) return hitSources;

		final Random random = new Random();
		for (String url : urls) {
			final HitSource hs = new HitSource();
			hs.setUrl(url);
			hs.setHit(random.nextInt(1000));
			hitSources.add(hs);
		}
		Collections.sort(hitSources, new Comparator<HitSource>() {
			@Override
			public int compare(HitSource o1, HitSource o2) {
				return o2.getHit() - o1.getHit();
			}
		});
		final int maxHit = hitSources.get(0).getHit();

		for (HitSource hs : hitSources) {
			hs.setPercent(hs.getHit() * 100.0 / maxHit);
		}
		return hitSources;
	}

//	public int getHitOfToday(String username) {
//
//	}
}
