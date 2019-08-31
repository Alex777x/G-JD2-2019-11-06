package by.itacademy.aalexandrov.poker.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.GeneralSecurityException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/file")
public class FileUploadController {

	private static String lastUploadedFileUid;

	public static final String FILE_FOLDER = "d:\\";

	@RequestMapping(method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("file") final MultipartFile file,
			final RedirectAttributes redirectAttributes) throws IOException, GeneralSecurityException {
		String originalFilename = file.getOriginalFilename(); // to DB
		// String contentType = file.getContentType();// to DB
		String uuid = UUID.randomUUID().toString(); // to DB

		lastUploadedFileUid = uuid;
		System.out.printf("Uploaded file %s", originalFilename);

		InputStream inputStream = file.getInputStream();
		Files.copy(inputStream, new File(FILE_FOLDER + uuid).toPath(), StandardCopyOption.REPLACE_EXISTING);
		return "redirect:/";
	}

	@RequestMapping(value = "/image")
	public @ResponseBody byte[] getImage(@RequestParam(name = "uuid", required = false) String uuid)
			throws IOException {

		if (uuid == null) {
			uuid = lastUploadedFileUid;
		}
		if (uuid == null) {
			return null;
		}

		byte[] byteArray = readFileToByteArray(new File(FILE_FOLDER + uuid));
		return byteArray;
	}

	/**
	 * This method uses java.io.FileInputStream to read file content into a byte
	 * array
	 * 
	 * @param file
	 * @return
	 */
	private static byte[] readFileToByteArray(File file) {
		byte[] bArray = new byte[(int) file.length()];
		try (FileInputStream fis = new FileInputStream(file);) {

			fis.read(bArray);
			fis.close();

		} catch (IOException ioExp) {
			ioExp.printStackTrace();
		}
		return bArray;
	}
}