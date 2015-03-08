<p>
    <facebook:picture
            facebookId="${user.id}"
            linkEnabled="true" />
    ${user.name}
</p>
<small>
    With permissions:
    <ul>
        <g:each in="${permissions}" var="permission">
            <li>
                ${permission.permission} (${permission.status})
            </li>
        </g:each>
    </ul>
</small>