package com.andone.blog.util;

import java.io.InputStream;

import org.json.JSONException;

import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;
import com.qiniu.api.rs.RSClient;


public class FileUtils {
											  
	private static final String ACCESS_KEY = "Z2falupC7NPzcGrII4L77G_GY9TrXM9o-baRHN2D";//这里填上面我们讲到的，密钥管理里面的密钥
    private static final String SECRET_KEY = "nd-NLlPQ0QO2Y5D1oWXLLrBtY-I3tM3Gmy_PCJG4";
    										  
    private static final String BUCKET_NAME = "blog";//填我们在七牛云创建的 Bucket 名字

    /**
     * 上传图片到七牛云存储
     * @param reader
     * @param fileName
     */
    public static void upload(InputStream reader, String fileName) {
        String uptoken;
        try {
            Mac mac = new Mac(ACCESS_KEY, SECRET_KEY);
            PutPolicy putPolicy = new PutPolicy(BUCKET_NAME);
            uptoken = putPolicy.token(mac);
            PutRet putRet = IoApi.Put(uptoken, fileName, reader, null);
        } catch (AuthException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除七牛云存储上的图片
     * @param key
     */
    public static void delete( String key) {
        Mac mac = new Mac(ACCESS_KEY, SECRET_KEY);
        RSClient client = new RSClient(mac);
        client.delete(BUCKET_NAME, key);
    }
    
    
}
