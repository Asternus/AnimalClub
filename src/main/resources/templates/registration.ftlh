<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
   <p><h3>Registration</h3></p> <br>
    ${message!}
    <@l.login "/registration" true/>

</@c.page>