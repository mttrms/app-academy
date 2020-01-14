# Jbuilder
- Tool to customize JSON responses sent from Rails server
- `render json: @users` will send down all data, which is not necessary

```
def show
	@user = User.find(params[:id])
	response = {}
	response[:id] = @user.id
	response[:username] = @user.username

	render json: response
end
```

* Not a bad implementation, but gets more complicated to grab + clean associated data for the user
* With Jbuilder, we can use `views` folder to create JSON templates for responses.
* Create a `*.json.jbuilder` file to render a JSON view

```
# /app/views/api/users/show.json.jbuilder
json.extract! @user, :id, :username
json.comments do
    @user.comments.each do |comment|
        json.set! comment.id do
            json.extract! comment, :id, :author_id, :body, :created_at
        end
    end
end
```

* The above Jbuilder renders this response:
```
{
    "id": 1
    "username": "howardmohr93",
    "comments": {
        "1": {
            "id": "1",
            "author_id": "1",
            "body": "Can't complain",
            "created_at": "2019-02-20 13:33:06 -0800"
        },
    }
}
```

## Common Jbuilder methods

### json.key
Specify a key/value in the response
```
json.username "Bob"

# response:
{ "username": "Bob" }

json.title "The first post"
json.author do
    json.username "Bob"
end

# response:
{
    "title": "The first post",
    "author": {
        "username": "Bob"
    }
}

```

### json.extract!
Extract attributes from an instance directly

```
json.extract! @user, :fullname, :company, :email

# response:
{
	"fullname": "A name",
	"company": "ABC Inc.",
	"email": "some.email@mail.com"
}
```

### json.set!
Set keys that need to be evaluated as variables

```
json.set! @user.id do
	json.extract! @user, :fullname, :company, :email
end

# response:
{
	1: {
		"fullname": "A name",
		"company": "ABC Inc.",
		"email": "some.email@mail.com" 
	}
}
```

## Configuring Rails to look for Jbuilder views
* Set the default format of resources to :json with: `defaults: { format: :json } do`
* Rails will automatically look for a `.json` file when you pass a template to `#render`

