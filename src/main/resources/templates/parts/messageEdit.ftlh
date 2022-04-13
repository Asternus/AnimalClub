<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Message editor
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">

            <div class="form-group row">
                <div class="col-sm-6">
                    <input type="text" name="text" <#if tagError??>value="${userMessage.text}"</#if>
                           class="form-control ${(textError??)?string('is-invalid', '')}"
                           placeholder="Введите сообщение" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-6">
                    <input type="text" name="tag" <#if textError??>value="${userMessage.tag}"</#if>
                           class="form-control ${(tagError??)?string('is-invalid', '')}"
                           placeholder="введите #тэг" />
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="form-group">
                <input type="text" class="form-control" name="link" placeholder="link" <#if (textError?? || tagError??)>value="${userMessage.link}"</#if> >
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save message</button>
            </div>
        </form>
    </div>
</div>