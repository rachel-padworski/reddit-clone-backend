user = User.create(username: "rachel2020", password: "password")
user2 = User.create(username: "kevin2020", password: "password")

post = Post.create(id: 1, user_id: 1, title: "TITLE", content: "This is my post. It's pretty cool.", image_url: "https://images.unsplash.com/photo-1607242792481-37f27e1d74e1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")

comment = Comment.create(post_id: 1, user_id: 2, content: "gorgeous!")