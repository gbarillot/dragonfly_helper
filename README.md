Dragonfly helper - SEO friendly URL's and cache with Dragonfly
===================================

I really love using <a href="https://github.com/markevans/dragonfly/blob/master/README.md">Dragonfly</a> for image handling/on-the-fly resizing with Ruby on Rails, but I didn't found out how to get regulars "friendly SEO" URL's.
I also needed better performance and caching... so I wrote this simple snippet and then I got the best of both worlds : paper_clip like URLs, perfomances AND on the fly image resizing.   


## Key benefits

* All advantages of Dragonfly (only one field in database, powerfull on-the-fly resizing...)  
* SEO friendly URL's (ex: /images/my_product.jpg)
* Caching
* Also handles custom attributes (data attributes, custom path...)

## Drawbacks

* Won't handle S3 or whatever cloud files

Installation
===================================

Install <a href="https://github.com/markevans/dragonfly/blob/master/README.md">Dragonfly</a> first, then simply drop 'dragonfly_helper.rb' into your helpers dir. 

Usage
===================================

You can then use it like this

```haml
= thumbnail_tag user.avatar, '100x100'
```

It will then generate a thumbnailed image and output an image tag like this

```html
<img src='/images/user_avatar.jpg' width='100px' height='100px' alt="user_avatar" />
```

Or like this

```haml
= thumbnail_tag product.image, '200x50', :path => '/products/small/', :alt => product.name
```

So

```html
<img src='/products/small/product_image_file_name.jpg' width='200px' height='50px' alt="such a nice product name" />
```

Or even...

```haml
= thumbnail_tag product.image, '200x50', :alt => product.name, :data > {:do =>'some_action', :trigger =>'that'}
```

Then

```html
<img src='/products/small/product_image_file_name.jpg' width='200px' height='50px' alt="such a nice product name" data-do='some_action' data-trigger='that' />
```

