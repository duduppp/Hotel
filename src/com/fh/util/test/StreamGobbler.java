package com.fh.util.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.logging.Logger;

public class StreamGobbler extends Thread {
	InputStream is;
	String type;
	private static int i = 1;
	private static int j = 1;

	public StreamGobbler(InputStream is, String type) {
		this.is = is;
		this.type = type;
	}

	public StreamGobbler() {

	}

	public void run() {
		try {
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			i++;
			j++;
			String line = null;
			while ((line = br.readLine()) != null) {
				if (type.equals("Error")) {
					// log.error(line);
					// System.err.println(line);
				} else {
					// log.info(line);
					// System.out.println(line);
				}
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
}