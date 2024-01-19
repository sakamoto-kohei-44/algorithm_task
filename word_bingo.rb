require 'set'

S = gets.to_i
bingo_card = Array.new(S) { gets.chomp.split }

N = gets.to_i

select_words = []
# 配列にN個の単語を追加
N.times do
  select_words << gets.chomp
end

# Setオブジェクトを作成
select_words_set = Set.new(select_words)
# 変数を定義するが現時点でビンゴは成立していないからfalseを設定
bingo = false

# 横の行をチェックする
S.times do |i|  # 各行に対してのループ
  bingo = true  # 行の全ての単語がビンゴと仮定
  S.times do |j|  # 現在の行（i）の各列（j）に対してのループ
    unless select_words_set.include?(bingo_card[i][j])
      bingo = false
      break
    end
  end
  break if bingo
end

# 縦の行をチェックする
if !bingo
  S.times do |i|  # 各列に対してのループ
    bingo = true
    S.times do |j|
      unless select_words_set.include?(bingo_card[j][i])
        bingo = false
        break
      end
    end
    break if bingo
  end
end

# 斜めの行をチェックする
# 左上から右下への斜めのチェック
if !bingo
  bingo = true
  S.times do |i|
    unless select_words_set.include?(bingo_card[i][i])
      bingo = false
      break
    end
  end
end
# 右上から左下への斜めのチェック
if !bingo
  bingo = true
  S.times do |i|
    unless select_words_set.include?(bingo_card[i][S-i-1])
      bingo = false
      break
    end
  end
end

if bingo
  puts 'yes'
else
  puts 'no'
end