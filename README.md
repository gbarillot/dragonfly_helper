Dragonfly helper - SEO friendly URL's and cache with Dragonfly
===================================

I really love Dragonfly for image handling/on the fly resizing using Ruby on Rails, but I didn't found out how to get regulars "friendly SEO" URL's.
I also needed better performance and caching... so I wrote this simple snippet and then I got the best of both worlds : paper_clip like URLs, perfomances AND on the fly image resizing.   


## Key benefits

* All the advantages of Dragonfly (only one field in database, on the fly resizing...)  
* SEO friendly URL's like /images/my_product.jpg
* Caching
* Handles of all of your custom attributes (data attributes, custom path...)

## Drawbacks

* Won't handle your S3 or whatever cloud filess

Installation
===================================

Install Dragonfly first, then simply drop 'dragonfly_helper.rb' into your helpers dir. You can also test it out (require some tweaking but hey, you're a man, aren't you ?)

Usage
===================================

You can then use it like this

```haml
= thumbnail_tag user.avatar, '100x100'
```

Then it will generate a thumbnailed image and output an image tag like this

```html
<img src='/images/user_avatar.jpg' width='100px' height='100px' alt="user_avatar">
```

Or like this

```haml
= thumbnail_tag product.image, '200x50', :path => "/products/small/, :alt => "#{product.name}"
```

This will then output 

```html
<img src='/products/small/product_image_file_name.jpg' width='200px' height='50px' alt="such a nice product name">
```

Or even...

```haml
= thumbnail_tag product.image, '200x50', :alt => "#{product.name}", :data > {:do =>'some_action', :trigger =>'that'}
```

Then

```html
<img src='/products/small/product_image_file_name.jpg' width='200px' height='50px' alt="such a nice product name" data-do='some_action' data-trigger='that'>
```

