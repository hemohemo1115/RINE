//roomを再読み込みしないとなぜかリアルタイムチャット機能がうまくいかないのでそれ用
if (window.name != "xyz")
	{
		location.reload();
		window.name = "xyz";
	}