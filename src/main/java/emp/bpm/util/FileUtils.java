package emp.bpm.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bpm.vo.BusinessPlanVO;

@Component("bpmFileUtils")
public class FileUtils {
	
	  private static final String filePath = "/home/ubuntu/mp/file/";	
	 
	public List<Map<String, Object>> parseInsertFileInfo(BusinessPlanVO businessPlanVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		/*
			Iterator�� �뜲�씠�꽣�뱾�쓽 吏묓빀泥�? �뿉�꽌 而щ젆�뀡�쑝濡쒕��꽣 �젙蹂대�� �뼸�뼱�삱 �닔 �엳�뒗 �씤�꽣�럹�씠�뒪�엯�땲�떎.
			List�굹 諛곗뿴�� �닚李⑥쟻�쑝濡� �뜲�씠�꽣�쓽 �젒洹쇱씠 媛��뒫�븯吏�留�, Map�벑�쓽 �겢�옒�뒪�뱾�� �닚李⑥쟻�쑝濡� �젒洹쇳븷 �닔媛� �뾾�뒿�땲�떎.
			Iterator�쓣 �씠�슜�븯�뿬 Map�뿉 �엳�뒗 �뜲�씠�꽣�뱾�쓣 while臾몄쓣 �씠�슜�븯�뿬 �닚李⑥쟻�쑝濡� �젒洹쇳빀�땲�떎.
		*/
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bpm_bplan_idx = businessPlanVO.getBpm_bplan_idx();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("bpm_bplan_idx", bpm_bplan_idx);
				listMap.put("file_fname", originalFileName);
				listMap.put("file_sname", storedFileName);
				listMap.put("file_size", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(BusinessPlanVO businessPlanVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{ 
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 
		int bpm_bplan_idx = businessPlanVO.getBpm_bplan_idx();
		while(iterator.hasNext()){ 
			multipartFile = mpRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false){ 
				originalFileName = multipartFile.getOriginalFilename(); 
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = getRandomString() + originalFileExtension; 
				multipartFile.transferTo(new File(filePath + storedFileName)); 
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("bpm_bplan_idx", bpm_bplan_idx);
				listMap.put("file_fname", originalFileName);
				listMap.put("file_sname", storedFileName);
				listMap.put("file_size", multipartFile.getSize());
				list.add(listMap); 
			} 
		}
		if(files != null && fileNames != null){ 
			for(int i = 0; i<fileNames.length; i++) {
					listMap = new HashMap<String,Object>();
                    listMap.put("IS_NEW", "N");
					listMap.put("FILE_IDX", files[i]); 
					list.add(listMap); 
			}
		}
		return list; 
	}

	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
