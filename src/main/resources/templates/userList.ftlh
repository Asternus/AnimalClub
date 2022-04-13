<#import "parts/common.ftlh" as c>

<@c.page>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/user" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                       placeholder="Search by userName">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <div class="mt-1">
        <a class="btn btn-danger" href="/user/registration">Add new</a>
    </div> <br>

    <table class="table table-bordered table-dark">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Guild</th>
            <th scope="col">Active</th>
            <th scope="col">Admin status</th>
            <th scope="col">Vip status</th>
            <th scope="col">Option</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <th scope="row">${user.getId()}</th>
                <td>${user.getUsername()}</td>
                <td>${user.getEmail()}</td>
                <td>${user.getGuild()}</td>
                <#if user.isActive()>
                    <td>ACTIVE</td>
                <#else>
                    <td>DISABLED</td>
                </#if>
                <#if user.isAdmin()>
                    <td>ADMIN</td>
                <#else>
                    <td>USER</td>
                </#if>
                <#if user.isVipStatus()>
                    <td>VIP</td>
                <#else>
                    <td>disabled</td>
                </#if>
                <td>
                    <div class="mb-1">
                        <a class="btn btn-primary" href="/user/${user.getId()}">Edit</a>
                    </div>
                    <div class="mt-1">
                        <a class="btn btn-danger" href="user/del/${user.getId()}">Delete</a>
                    </div>
                    <div class="mt-1">
                        <a class="btn btn-warning" href="user/ban/${user.getId()}"><#if user.isActive()>Block<#else>Unblock</#if></a>
                    </div>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>