#関数内で格納か、関数（処理）に関数（格納）を入れて格納か

#現状の得点と投げた後の得点
puts "好きなゲームを入力してね：301 501 701 901 1101 1501"
# select_game = gets.to_i
select_game = 301
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

#判定1
def first_judgement(first_score)
    if first_score <= -1 then
        puts "burst!!"
    elsif first_score == 0 then
        puts "You Win!!"
        exit
    else
        return
    end
end

#判定2
def second_judgement(second_score)
    if second_score <= -1 then
        puts "burst!!"
    elsif second_score == 0 then
        puts "You Win!!"
        exit
    else
        return
    end
end

#判定3
def third_judgement(third_score)
    if third_score <= -1 then
        puts "burst!!"
    elsif third_score == 0 then
        puts "You Win!!"
        exit
    else
        return
    end
end

#結果をresultに追加
def result_push(num)
    @result.push(num)
end

#raund数カウント
def raund_cnt(cnt)
    cnt += 1
    puts "#{cnt}ラウンド目"
end

#配列の末尾取得
def array_last()
    @result.last
end

#1ラウンド目のみのゲーム
def first_game()
    raund_cnt(0)
    first_score = first_throw(@start_score, gets.to_i)
    first_judgement(first_score)
    second_score = second_throw(first_score, gets.to_i)
    second_judgement(second_score)
    third_score = three_throw(second_score, gets.to_i)
    third_judgement(third_score)

    result_push(third_score)
    p @result
end
first_game

#15ラウンドまで回す
games = 1
for games in 1..14 do

    raund_cnt(games)
    first_score = first_throw(array_last, gets.to_i)
    first_judgement(first_score)
    second_score = second_throw(first_score, gets.to_i)
    second_judgement(second_score)
    third_score = three_throw(second_score, gets.to_i)
    third_judgement(third_score)

    result_push(third_score)
    p @result

end

# 次は1投目と2投目を足したものをpush : OK
# 次は2投目と3投目を足したものをpush : OK
# もし0以下ならburst 0ちょうどなら終わり : OK
# 15ラウンドで終了。 : OK
# 得点を引き継ぐ　配列の末尾を取得 : OK
# You Winが表示されたらプログラム終了 : OK

# 何ラウンド目か文字入れたい：配列のカウントして末尾につける
# player_2の作成
# どちらも0にならなかったら残数の少ない方が勝ち


# 【備忘録】
# 関数内で四則演算時に結果を変数に入れてreturnしたらpushで追加できなかったから、計算式のみでreturnしたら動いた。