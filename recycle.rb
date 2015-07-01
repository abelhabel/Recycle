

def by_pop(amount)
  price = 2
  bottles = (amount/price).floor()
  cash_out = {
    bottles: bottles,
    money_back: amount % price,
    bottle_invest: (bottles / 2).floor,
    bottle_surplus: bottles % 2,
    cap_invest: (bottles / 4).floor,
    cap_surplus: bottles % 4,
  }
  cash_out
end

def prompt_customer
  done = false
  begin
    puts "How much money will you buy bottles for?"
    reply = gets.chomp.to_i
    bottles = by_pop(reply)
    bottle_surplus_t = "If you buy 1 more bottle you will get 1 more bottle from recycling" if bottles[:bottle_surplus] > 0
    cap_surplus_t = "If you buy #{4 - bottles[:cap_surplus]} more bottle(s) you will get 1 more bottle from cap recycling" if bottles[:cap_surplus] > 0
    puts "You bought #{bottles[:bottles]} bottle(s), for #{reply} dollars and got #{bottles[:money_back]} dollar back. #{bottle_surplus_t}. #{cap_surplus_t}."
    puts "Any other customer? (Y/N)"
    reply = gets.chomp
    if reply.downcase == 'n'
      done = true;
    end
  end while !done
end

prompt_customer