#関数内で格納か、関数（処理）に関数（格納）を入れて格納か

#現状の得点と投げた後の得点
puts "好きなゲームを入力してね：301 501 701 901 1101 1501"
select_game = gets.to_i
puts "#{select_game}でゲームスタート!!"
@start_score = select_game
@result = []

# 1投目計算
def first_throw(start_score, throw_score)
    return start_score - throw_score
end

# 2投目計算
def second_throw(first_score, throw_score)
    return first_score - throw_score
end

# 3投目計算
def three_throw(second_score, throw_score)
    return second_score - throw_score
end

#結果をresultに追加
def result_push(num)
    @result.push(num)
end

first_score = first_throw(@start_score, gets.to_i)
second_score = second_throw(first_score, gets.to_i)
three_score = three_throw(second_score, gets.to_i)

result_push(three_score)
p @result

# 次は1投目と2投目を足したものをpush : OK
# 次は2投目と3投目を足したものをpush : OK
# もし0以下ならburst 0ちょうどなら終わり
# 何ラウンド目か文字入れたい：配列のカウントして末尾につける
# 15ラウンドで終了。どちらも0にならなかったら残数の少ない方が勝ち

# 【備忘録】
# 関数内で四則演算時に結果を変数に入れてreturnしたらpushで追加できなかったから、計算式のみでreturnしたら動いた。