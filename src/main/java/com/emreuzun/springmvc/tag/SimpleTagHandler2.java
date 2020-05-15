package com.emreuzun.springmvc.tag;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SimpleTagHandler2 extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        getJspContext().setAttribute("message", "Message!");
        getJspBody().invoke(null);
    }
}