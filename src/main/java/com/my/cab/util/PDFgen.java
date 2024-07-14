package com.my.cab.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;

import org.springframework.stereotype.Component;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.my.cab.dto.EmpDTO;

@Component
public class PDFgen {

	public void generateItinerary(EmpDTO empDTO, String filePath) {

		Document document = new Document();

		try {
			PdfWriter.getInstance(document, new FileOutputStream(filePath));


			document.open();

			BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			Font font = new Font(baseFont, 12);

			document.add(generateTable(empDTO, font));

			document.close();

		} catch (FileNotFoundException | DocumentException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	private PdfPTable generateTable(EmpDTO dto, Font font) {
	    PdfPTable table = new PdfPTable(2);

	    PdfPCell cell;

	    // 제목 셀
	    cell = new PdfPCell(new Phrase(dto.getCurrMonth(), font));
	    cell.setColspan(2);
	    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	    table.addCell(cell);

	    // 일반 텍스트 셀
	    addAlignedCell(table, "성명", dto.getEmp_name(), font);
	    addAlignedCell(table, "소속", dto.getDept_name(), font);
	    addAlignedCell(table, "직급", dto.getTitle_name(), font);

	    // 지급 내역
	    cell = new PdfPCell(new Phrase("지급 내역", font));
	    cell.setColspan(2);
	    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	    table.addCell(cell);

	    addAlignedCell(table, "기본급", formatCurrency(dto.getSal_base()) + "원", font);
	    addAlignedCell(table, "식대", formatCurrency(dto.getSal_meal()) + "원", font);
	    addAlignedCell(table, "직급 수당", formatCurrency(dto.getTitle_add_pay()) + "원", font);
	    addAlignedCell(table, "보너스", formatCurrency(dto.getSal_bonus()) + "원", font);

	    // 공제 내역
	    cell = new PdfPCell(new Phrase("공제 내역", font));
	    cell.setColspan(2);
	    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	    table.addCell(cell);

	    addAlignedCell(table, "국민 연금", formatCurrency(dto.getInsur1()) + "원", font);
	    addAlignedCell(table, "건강 보험", formatCurrency(dto.getInsur2()) + "원", font);
	    addAlignedCell(table, "장기요양보험", formatCurrency(dto.getInsur3()) + "원", font);
	    addAlignedCell(table, "고용보험", formatCurrency(dto.getInsur4()) + "원", font);
	    addAlignedCell(table, "소득세", formatCurrency(dto.getInsur5()) + "원", font);
	    addAlignedCell(table, "지방소득세", formatCurrency(dto.getInsur6()) + "원", font);

	    // 합계
	    cell = new PdfPCell(new Phrase("합계", font));
	    cell.setColspan(2);
	    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	    table.addCell(cell);

	    addAlignedCell(table, "총 급여", formatCurrency(dto.getSal_total()) + "원", font);
	    addAlignedCell(table, "공제총액", formatCurrency(dto.getTotal_ded()) + "원", font);
	    addAlignedCell(table, "실지급액", formatCurrency(dto.getSal_actual()) + "원", font);

	    return table;
	}

	private void addAlignedCell(PdfPTable table, String label, String value, Font font) {
	    PdfPCell labelCell = new PdfPCell(new Phrase(label, font));
	    PdfPCell valueCell = new PdfPCell(new Phrase(value, font));
	    valueCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	    
	    table.addCell(labelCell);
	    table.addCell(valueCell);
	}

	private String formatCurrency(Object value) {
	    if (value instanceof Number) {
	        NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);
	        return formatter.format(value);
	    }
	    return String.valueOf(value);
	}
}

