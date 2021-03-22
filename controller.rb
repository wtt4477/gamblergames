require 'sinatra'

gambler = Gambler.new 

post '/home' do
  stake=params[:stake].to_i
  number=params[:number].to_i
  roll=rand(6)+1
  if number==roll
    if(!session[:lost])
      save_session(:lost, 0)
    end
    save_session(:won, 10*stake)


gambler.username = "user_1"
gambler.password = "1234"
gambler.totalwin = session[:won]
gambler.totalloss = session[:lost]
gambler.totalprofit = session[:won] - session[:lost]
gambler.save
     
    %{<html>
<head>
    <title>calculation page</title>
    <link rel="stylesheet" type="text/css" href="link.css"/>
  </head>
  <body>

<div style="width:1000px;height:1000px;border:solid 2px blue;">

  <div class="header-top" style="background-color:#A9A9A9; width:1000px;height:120px;">
  <h1 align="center" style="color:black;">Gambling Site</h1>
  </div>

  <div class ="container" style="border:solid 2px blue; width:200px;height:230px;float:right;margin-right:100px;margin-top:20px">
    <form action="/home" method='post'>
      <br>
      total win #{session[:won]}<br>
      <br>
      total loss #{session[:lost]}
      <br>
      <br>
      total profit #{session[:won] - session[:lost]}
      <br>
      <br>
    </form>
  </div>

  <div class ="container" style="background-color:#FFFFFF; width:600px;height:300px;">
  <br>
  <h2> place your bet on dice number (1 to 6)</h2>
    <form action="/home" method='post'>
      bet money <input type='text' id='stake' name='stake'></input><br>
      <br>
      <br>
      on <input style="margin-left:50px; "type='text' id='number' name='number'></input>
      <br>
      <br>
      <input style="margin-left:165px;" type='submit' name='bet' value="bet"></input>
    </form>
  </div>
  <div class ="container" style="background-color:#FFFFFF; width:1000px;height:500px;">
  <h2>account</h2>
  <div class ="container" style="border:solid 2px blue; width:800px;height:250px;float:left;margin-left:20px;margin-top:20px">

    <form action="/home" method='post'>
      <br>
      <h3>total win&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;total loss &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;total profit</h3>
      <h3>#{session[:won]}&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      #{session[:lost]}&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      #{session[:won] - session[:lost]}<h3>
      <br>
      <br>
      <br>
      <br>
    </form>
    <form action="/logout" method='post'>
      <input style="margin-left:5px;" type='submit' name='logout' value="Logout"></input>
    </form>
  </div>
  
</div>
      </body>
</html>

}


  else
    if(!session[:won])
      save_session(:won, 0)
    end
    save_session(:lost, stake)
  
  
  gambler.username = "user_1"
  gambler.password = "1234"
  gambler.totalwin = session[:won]
  gambler.totalloss = session[:lost]
  gambler.totalprofit = session[:won] - session[:lost]
  gambler.save

    %{<html>
<head>
    <title>calculation page</title>
    <link rel="stylesheet" type="text/css" href="link.css"/>
  </head>
  <body>

<div style="width:1000px;height:1000px;border:solid 2px blue;">

  <div class="header-top" style="background-color:#A9A9A9; width:1000px;height:120px;">
  <h1 align="center" style="color:black;">Gambling Site</h1>
  </div>

  <div class ="container" style="border:solid 2px blue; width:200px;height:230px;float:right;margin-right:100px;margin-top:20px">
    <form action="/home" method='post'>
      <br>
      total win #{session[:won]}<br>
      <br>
      total loss #{session[:lost]}
      <br>
      <br>
      total profit #{session[:won] - session[:lost]}
      <br>
      <br>
    </form>
  </div>

  <div class ="container" style="background-color:#FFFFFF; width:600px;height:300px;">
  <br>
  <h2> place your bet on dice number (1 to 6)</h2>
    <form action="/home" method='post'>
      bet money <input type='text' id='stake' name='stake'></input><br>
      <br>
      <br>
      on <input style="margin-left:50px; "type='text' id='number' name='number'></input>
      <br>
      <br>
      <input style="margin-left:165px;" type='submit' name='bet' value="bet"></input>
    </form>
  </div>
  <div class ="container" style="background-color:#FFFFFF; width:1000px;height:500px;">
  <h2>account</h2>
  <div class ="container" style="border:solid 2px blue; width:800px;height:250px;float:left;margin-left:20px;margin-top:20px">

    <form action="/home" method='post'>
      <br>
      <h3>total win&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;total loss &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;total profit</h3>
      <h3>#{session[:won]}&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      #{session[:lost]}&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      #{session[:won] - session[:lost]}<h3>
      <br>
      <br>
      <br>
      <br>
    </form>
    <form action="/logout" method='post'>
      <input style="margin-left:5px;" type='submit' name='logout' value="Logout"></input>
    </form>
  </div>
  
</div>
      </body>
</html>

}

  end
end

def save_session(won_lost, money)
  count = (session[won_lost] || 0).to_i
  count += money
  session[won_lost] = count
end