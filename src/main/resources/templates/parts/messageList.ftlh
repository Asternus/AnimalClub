<#include "security.ftlh">
<#import "pager.ftlh" as p>

<@p.pager url page />
<div class="card-columns">
    <#list page.content as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <#if message.link??>
                <img src="${message.link}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span> <br>
                <i>#${message.tag}</i> <br>
                <i>${message.author.getGuild()}</i> <br>
            </div>
            <div class="card-footer text-muted container">
                <div class="row">
                    <a class="col align-self-center"
                       href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <#if message.author.id == currentUserId || isAdmin>

                        <div class="mr-1">
                            <a class="col btn btn-primary"
                               href="/user-messages/${message.author.id}?message=${message.id}">
                                Edit
                            </a>
                        </div>
                        <div class="mx-0">
                            <a class="col btn btn-danger"
                               href="/del-user-messages/${message.author.id}?message=${message.id}">
                                Delete
                            </a>
                        </div>

                    </#if>
                </div>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>
<@p.pager url page />