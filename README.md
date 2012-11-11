# Angular::Commons::Middleware

Collection of Angular modules used accross Quarter Spiral applications

## Setup

Insert the middleware in your application

```ruby
use Angular::Commons::Middleware
```

Put the following JavaScript links into your page:

```html
<!-- Angular must be included before these -->
<script src="/angular-commons/javascripts/envs.js"></script>
<script src="/angular-commons/javascripts/services.js"></script>
<script src="/angular-commons/javascripts/controllers.js"></script>
```

Make sure to set the ``ENV_KEYS_TO_EXPOSE`` constant somewhere in your application to expose environment variables to the Angular app. Example:

```ruby
ENV_KEYS_TO_EXPOSE = ['QS_DEVCENTER_BACKEND_URL', 'QS_CANVAS_APP_URL', 'QS_S3_HOST', 'QS_AUTH_BACKEND_URL']
```
