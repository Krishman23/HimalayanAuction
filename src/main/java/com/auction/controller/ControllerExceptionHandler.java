package com.auction.controller;

import java.io.FileNotFoundException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

//@ControllerAdvice
public class ControllerExceptionHandler {

	public static final String DEFAULT_ERROR_VIEW = "error";

	@ExceptionHandler(FileNotFoundException.class)
	public ModelAndView handleError(HttpServletRequest req, FileNotFoundException exception) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("fileNotFound", exception.getMessage());
		mav.setViewName("FileNotFound");
		return mav;
	}

	@ExceptionHandler(value = NoHandlerFoundException.class)
	public ModelAndView handleError404(HttpServletRequest request, Exception e) throws Exception {

		if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) != null)
			throw e;
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);
		mav.addObject("errorcode", "404");
		mav.addObject("exception", e);
		mav.addObject("exceptionClass", e.getClass());
		mav.addObject("exceptionClassName", e.getClass().getName());
		mav.addObject("exceptionClassSimpleName", e.getClass().getSimpleName());
		mav.addObject("url", request.getRequestURL());
		mav.setViewName(DEFAULT_ERROR_VIEW);
		return mav;
	}
	
//	@ExceptionHandler(value = InternalServerErrorException.class)
//	public ModelAndView handleError500(HttpServletRequest request, Exception e) throws Exception {
//
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("exception", e);
//		mav.addObject("errorcode", "500");
//		mav.addObject("exception", e);
//		mav.addObject("exceptionClass", e.getClass());
//		mav.addObject("exceptionClassName", e.getClass().getName());
//		mav.addObject("exceptionClassSimpleName", e.getClass().getSimpleName());
//		mav.addObject("url", request.getRequestURL());
//		mav.setViewName(DEFAULT_ERROR_VIEW);
//		return mav;
//	}
		  
//		  @ExceptionHandler(InternalServerErrorException.class) public String
//		  handle(Exception ex) {
//		  
//		  return "error";//this is view name }
		 
	// BIG BUCKET

	@ExceptionHandler(value = Exception.class)
	public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
		// If the exception is annotated with @ResponseStatus rethrow it and let
		// the framework handle it -

		if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) != null)
			throw e;
		// Otherwise setup and send the user to a default error-view.
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);
		mav.addObject("exceptionClass", e.getClass());
		mav.addObject("exceptionClassName", e.getClass().getName());
		mav.addObject("exceptionClassSimpleName", e.getClass().getSimpleName());

		mav.addObject("url", req.getRequestURL());
		mav.setViewName(DEFAULT_ERROR_VIEW);
		return mav;
	}

}