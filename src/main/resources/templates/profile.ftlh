<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message!}
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-5"><input type="text" name="password" class="form-control" placeholder="Password"/></div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-5"><input type="email" name="email" class="form-control" placeholder="email"
                                         value="${email!''}"/></div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Save</button>
        <br>
    </form>

    <br>

    <div class="col-pt-6">
        <form method="post" action="/user/profile/delete">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <p>If you wand delete your profile: </p>
            <button class="btn btn-danger" type="submit">Delete</button>
        </form>
    </div>

</@c.page>