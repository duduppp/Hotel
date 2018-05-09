package com.fh.util.video;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentMap;

public interface PushHandler {

	ConcurrentMap<String, Object> push(Map<String, Object> paramMap)
			throws IOException;

}
