<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>Sign in to ULP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body>
    <div class="logindiv">
        <div class="login-content-remove">
            <div class="box-remove">
                <div class="flex-center pt-1p">
                    <img class="header-logo" src="${url.resourcesPath}/img/header_logo.svg" src="./asset/header_logo.svg" alt="Header Logo">
                </div>
                <div class="hr-st pt-1p">
                    <div class="fs-25 fw-600 text-center text-blue pooppins">
                        Universal Learners Passport
                    </div>
                    <div class="fs-20 text-gr text-center mb-2m dn_sans">
                        Welcome to your academic wallet
                    </div>
                </div>
                <div class="fs-20 text-bl text-center fw-500 pt-1p pooppins">
                    Welcome Back!
                </div>
                <div class="fs-25 text-bl text-center pt-05p fw-500 login pooppins">
                    Login Here
                </div>
                <#if displayMessage && message?has_content>
                <!--<div class="div_message_ alert alert-${message.type}">
                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                    <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                    <center><font class="message-text_ login_message">${message.summary}</font></center>
                </div>-->
                </#if>
                <br/>
                <#nested "form">
            </div> 
        </div>
        <br>
        <br>
    </div>
</body>
</html>
</#macro>
