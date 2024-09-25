<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>掲示板</title>
</head>
<body>
    <h1>掲示板</h1>

    <form action="{{ route('posts.store') }}" method="POST">
        @csrf
        <input type="text" name="title" placeholder="タイトル" required>
        <textarea name="content" placeholder="内容" required></textarea>
        <button type="submit">投稿</button>
    </form>

    <hr>

    @foreach ($posts as $post)
        <div>
            <h2>{{ $post->title }}</h2>
            <p>{{ $post->content }}</p>
            <small>{{ $post->created_at }}</small>
        </div>
        <hr>
    @endforeach
</body>
</html>
