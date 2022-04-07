<#import "parts/common.ftlh" as c>

<@c.page>
    <#if isCurrentUser>
        <h5>Hi, ${user.getUsername()}</h5>
    <#else>
        <h5>Hi, Guest!</h5>
        <i>If you want gain access to all sections and function of the site, please <a href="/login?logout" aria-current="page">login</a> or <a href="/registration" aria-current="page">register</a></i>
    </#if>

    <#if isCurrentUser>
        <h5>You ID: ${user.getId()}</h5>
        <h5>VIP status: ${vipStatus}</h5>
        <h5>You Guild:<a class="col align-self-center" href="/guild">${user.getGuild()}</a></h5>
        <h5>About you: ${aboutYou}</h5>
        <h5>Count of your messages:<a class="col align-self-center"
                                      href="/user-messages/${user.getId()}">${findUserMessages}</a></h5>

    </#if>


</@c.page>