package com.budev.controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GeneratePDF {


    private static Font TIME_ROMAN =
            new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
    private static Font TIME_ROMAN_SMALL =
            new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);


    public static Document createPDF(String file) throws DocumentException {

        Document document = null;

        try {
            document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(file));
            document.open();

            addMetaData(document);

            addTitlePage(document);

            document.close();

        } catch (FileNotFoundException e) {

            e.printStackTrace();
        }
        return document;

    }

    private static void addMetaData(Document document) {
        document.addTitle("Payment Receipt");
        document.addSubject("Payment Receipt");

    }

    private static void addTitlePage(Document document)
            throws DocumentException {

        Paragraph preface = new Paragraph();
        creteEmptyLine(preface, 1);
        preface.add(new Paragraph("PDF Report", TIME_ROMAN));

        creteEmptyLine(preface, 1);
        SimpleDateFormat simpleDateFormat =
                new SimpleDateFormat("MM/dd/yyyy");
        preface.add(new Paragraph(
                "Report created on " + simpleDateFormat
                        .format(new Date()), TIME_ROMAN_SMALL));
        document.add(preface);


    }

    private static void creteEmptyLine(Paragraph paragraph,
                                       int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }

    private static void createReceipt(Document document)
            throws DocumentException {
        Paragraph paragraph = new Paragraph();
        creteEmptyLine(paragraph, 2);
        document.add(paragraph);

    }


}
