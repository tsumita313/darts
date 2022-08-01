#関数内で格納か、関数（処理）に関数（格納）を入れて格納か
require 'byebug'
@result = []
@result_shadow = []
games = 1
display_cnt = 2
#現状の得点と投げた後の得点
puts "好きなゲームを入力してね：301 501 701 901 1101 1501"
# select_game = gets.to_i
select_game = 301
puts "#{select_game}でゲームスタート!!"
@start_score = select_game

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

@result_burst = []
#判定1
def first_judgement(first_score)
    if first_score <= -1 then
        @result_burst.push("burst")
        return puts "burst!!"
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
        @result_burst.push("burst")
        return puts "burst!!"
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
        @result_burst.push("burst")
        return puts "burst!!"
    elsif third_score == 0 then
        puts "You Win!!"
        exit
    else
        return
    end
end

#配列の末尾取得
def array_last()
    @result_shadow.last
end

#結果をresultに追加
def result_push(num)
    @result_shadow.push(num)
end

#raund数カウント
def raund_cnt(cnt)
    cnt += 1
    puts "#{cnt}ラウンド目"
end

def foo
    throw :exit, 25
end

#1ラウンド目のみのゲーム
def first_game()
    ret = catch(:exit) do
        # arr = [1]
        # arr2 = arr.map{ |x|
            raund_cnt(0)
            first_score = first_throw(@start_score, gets.to_i)
            first_judgement(first_score)
            # 1投目がburstしてたら値の格納
            if @result_burst.size == 1
                # burst入ってたら格納してしまう
                result_push(first_score)
                # 処理したからburst削除
                p @result_burst
                # @result_burst.shift()
                # p @result_burst
                foo
            end

            second_score = second_throw(first_score, gets.to_i)
            second_judgement(second_score)

            if @result_burst.size == 1
                # burst入ってたら格納してしまう
                result_push(second_score)
                # 処理したからburst削除
                p @result_burst
                foo
            end

            third_score = three_throw(second_score, gets.to_i)
            third_judgement(third_score)

            if @result_burst.size == 1
                # burst入ってたら格納してしまう
                result_push(third_score)
                # 処理したからburst削除
                p @result_burst
                foo
            end
        # }
    end

    #ここでシャドウには入れてる
    # result_push(third_score)
    #ここから表示用resultに入れる
    shadow_last = @result_shadow.last
    display_score = "1回目:#{shadow_last}"
    @result.push(display_score)
    p @result
end
first_game

#15ラウンドまで回す
for games in 1..14 do

    raund_cnt(games)
    first_score = first_throw(array_last, gets.to_i)
    first_judgement(first_score)
    second_score = second_throw(first_score, gets.to_i)
    second_judgement(second_score)
    third_score = three_throw(second_score, gets.to_i)
    third_judgement(third_score)

    #ここでシャドウには入れてる
    result_push(third_score)
    #ここから表示用resultに入れる
    shadow_last = @result_shadow.last
    display_score = "#{display_cnt}回目:#{shadow_last}"
    display_cnt += 1
    @result.push(display_score)
    p @result

end

p "ゲーム終了!!"

#burstならそのラウンド終了
# if first_judgement(first_score) == "burst!!" then
#     result_push(first_score)
# elsif second_judgement(second_score) == "burst!!" then
#     result_push(second_score)
# elsif third_judgement(third_score) == "burst!!" then
#     result_push(third_score)
# end


# 次は1投目と2投目を足したものをpush : OK
# 次は2投目と3投目を足したものをpush : OK
# もし0以下ならburst 0ちょうどなら終わり : OK
# 15ラウンドで終了。 : OK
# 得点を引き継ぐ　配列の末尾を取得 : OK
# You Winが表示されたらプログラム終了 : OK
# 何ラウンド目か文字入れたい : OK

# もしburstしたらラウンドを終える
# player_2の作成
# どちらも0にならなかったら残数の少ない方が勝ち


# 【備忘録】
# 関数内で四則演算時に結果を変数に入れてreturnしたらpushで追加できなかったから、計算式のみでreturnしたら動いた。
# 関数の切り取り
# 変数名
# 関数の結果を使いたいなぁ