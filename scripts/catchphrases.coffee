catchPhrases = {
    "хуй;dick;пенис;penis": ["http://krisa-gothic.narod.ru/copy2/huy2.jpg",
                             "http://www.reactiongifs.com/wp-content/uploads/2013/11/reverse.gif",
                             "http://svalko.org/data/2014_01_11_11_34_334190_1.jpeg",
                             "https://media.giphy.com/media/xThuWhBjBgKftTL7QQ/giphy.gif",
                             "https://media.giphy.com/media/EHKNZ0ICJoypq/giphy.gif",
                             "https://media.giphy.com/media/T4ERcmFmhwGIw/giphy.gif",
                             "https://media.giphy.com/media/SfFBnj1bCve48/giphy.gif"],

    "я хочу": ["все хотят", "хоти дальше"],

    "дайте мне": ["рука в говне"],

    "вы заебали;вы меня заебали": ["http://cs.pikabu.ru/images/big_size_comm/2013-12_5/13878250367568.gif",
                                   "https://media.giphy.com/media/jz6ulvBQtoyOc/giphy.gif"],

    "пойду посру;пойду посрать": ["http://risovach.ru/upload/2013/08/mem/muzhik-bleat_26371179_orig_.jpg",
                                  "http://risovach.ru/upload/2014/01/mem/chak-norris_41392559_orig_.jpg"],

    "WAT": ["http://i.imgur.com/lWCK5qo.jpg",
            "https://i.ytimg.com/vi/MCn9lL94sxQ/maxresdefault.jpg",
            "http://i0.kym-cdn.com/photos/images/newsfeed/000/173/576/Wat8.jpg?1315930535",
            "https://media.giphy.com/media/nRmkEsXdjaACY/source.gif",
            "https://media.giphy.com/media/GFLcKd6MXid2M/giphy.gif"],

}


sendReaction = (msg) ->
    resp = ""

    for code, responses of catchPhrases
        if ///#{msg.match[0]}///i.test code
            resp = msg.random responses

    msg.send resp

module.exports = (robot) ->
  for phrases, responses of catchPhrases
    for phrase in phrases.split ';'
      robot.hear ///#{phrase}///i, (msg) ->
        sendReaction msg

