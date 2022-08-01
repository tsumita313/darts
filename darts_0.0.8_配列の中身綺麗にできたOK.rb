#関数内で格納か、関数（処理）に関数（格納）を入れて格納か
require 'byebug'
#現状の得点と投げた後の得点
puts "好きなゲームを入力してね:301 501 701 901 1101 1501"
# select_game = gets.to_i
select_game = 301
puts "#{select_game}でゲームスタート!!"

@start_score = select_game
@display_result = []
@result_shadow = []
@result_burst = []
@result_shadow.push(select_game) 
games = 1, display_cnt = 2

def array_last
    @result_shadow.last
end

def result_shadow_push(num)
    @result_shadow.push(num)
end

def raund_cnt(cnt)
    cnt += 1
    puts "#{cnt}ラウンド目"
end

def foo
    throw :exit, 25
end

# １投目の合計のburst or Win判定後、格納して表示
def x1(current_score, throw_score, result_cnt_rand)
    first_score = current_score - throw_score
    if first_score <= -1 then
        @result_burst.push("burst")
        puts "burst!!"
    elsif first_score == 0 then
        puts "You Win!!"
        exit
    else
        @result_shadow.push(first_score)
    end
    # burstしてたら値の格納
    if @result_burst.size == 1
        # burst入ってたら格納してしまう
        # result_shadow_push(first_score)
        if @result_shadow.last == 0
            result_shadow_last = select_game
            display_score = "#{result_cnt_rand}回目:#{result_shadow_last}"
            @display_result.push(display_score)
            p @display_result
            @result_burst.shift()
            foo
        else
            result_shadow_last = @result_shadow.last
            display_score = "#{result_cnt_rand}回目:#{result_shadow_last}"
            @display_result.push(display_score)
            p @display_result
            @result_burst.shift()
            foo
        end
    end
end

def x2(array_last, throw_score, result_cnt_rand)
    first_score = array_last - throw_score
    if first_score <= -1 then
        @result_burst.push("burst")
        puts "burst!!"
    elsif first_score == 0 then
        puts "You Win!!"
        exit
    else
        @result_shadow.push(first_score)
    end
    # burstしてたら値の格納
    if @result_burst.size == 1
        # burst入ってたら格納してしまう
        # result_shadow_push(first_score)
        if @result_shadow.last == 0
            result_shadow_last = select_game
            display_score = "#{result_cnt_rand}回目:#{result_shadow_last}"
            @display_result.push(display_score)
            p @display_result
            @result_burst.shift()
            foo
        else
            result_shadow_last = @result_shadow.last
            display_score = "#{result_cnt_rand}回目:#{result_shadow_last}"
            @display_result.push(display_score)
            p @display_result
            @result_burst.shift()
            foo
        end
    end
end

def x3(array_last, throw_score, result_cnt_rand)
    first_score = array_last - throw_score
    if first_score <= -1 then
        @result_burst.push("burst")
        puts "burst!!"
    elsif first_score == 0 then
        puts "You Win!!"
        exit
    else
        @result_shadow.push(first_score)
        @result_shadow_last = @result_shadow.last
        display_score = "#{result_cnt_rand}回目:#{@result_shadow_last}"
        @display_result.push(display_score)
        p @display_result
    end
    # burstしてたら値の格納
    if @result_burst.size == 1
        # burst入ってたら格納してしまう
        # result_shadow_push(first_score)
        if @result_shadow.last == 0
            result_shadow_last = select_game
            display_score = "#{result_cnt_rand}回目:#{result_shadow_last}"
            @display_result.push(display_score)
            p @display_result
            @result_burst.shift()
            foo
        else
            result_shadow_last = @result_shadow.last
            display_score = "#{result_cnt_rand}回目:#{result_shadow_last}"
            @display_result.push(display_score)
            p @display_result
            @result_burst.shift()
            foo
        end
    end
end

def first_game()
    ret = catch(:exit) do
        raund_cnt(0)
        x1(@start_score, gets.to_i, 1)
        x2(array_last, gets.to_i, 1)
        x3(array_last, gets.to_i, 1)
    end
end
first_game

for games in 1..14 do
    raund_cnt(games)
    ret = catch(:exit) do
        x1(array_last, gets.to_i, display_cnt)
        x2(array_last, gets.to_i, display_cnt)
        x3(array_last, gets.to_i, display_cnt)
    end
    display_cnt += 1
end

# p @result
p "ゲーム終了!!"

# 次は1投目と2投目を足したものをpush : OK
# 次は2投目と3投目を足したものをpush : OK
# もし0以下ならburst 0ちょうどなら終わり : OK
# 15ラウンドで終了。 : OK
# 得点を引き継ぐ　配列の末尾を取得 : OK
# You Winが表示されたらプログラム終了 : OK
# 何ラウンド目か文字入れたい : OK
# もしburstしたらラウンドを終える
# burstは得点に反映しない
# 普通の特典が入らない
# 得点表示
# burstした時に得点が最初にもどる
# 配列の中身綺麗にしたい

# player_2の作成
# どちらも0にならなかったら残数の少ない方が勝ち


# 【備忘録】
# 関数内で四則演算時に結果を変数に入れてreturnしたらpushで追加できなかったから、計算式のみでreturnしたら動いた。