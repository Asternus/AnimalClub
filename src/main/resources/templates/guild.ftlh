<#import "parts/common.ftlh" as c>

<@c.page>
    <h3><p>Your guild: ${user.getGuild()} </p></h3> <br>
    <#include "parts/messageList.ftlh" />
</@c.page>