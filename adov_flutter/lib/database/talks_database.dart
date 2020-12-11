import 'package:adov_flutter/models/conference.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TalksDatabase {
  static var collectionReference =
      FirebaseFirestore.instance.collection('talks');

  static DocumentReference conferenceRef =
      FirebaseFirestore.instance.doc('conference/details');

  static Future<Map> getConferenceStats() async {
    Set<DateTime> days = Set();
    int talks = 0;

    await collectionReference.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        days.add(DateTime(
          element.data()["year"],
          element.data()["month"],
          element.data()["day"],
        ));
        talks++;
      });
    });
    return {"talks": talks, "days": days.length};
  }

  static Future<Conference> getConferenceDetails() async {
    var conference;

    await conferenceRef.get().then((value) {
      Map<String, dynamic> attributes = Map();
      value.data().forEach((key, value) => {attributes[key] = value});
      conference = Conference.fromJson(attributes);
    });

    return conference;
  }

  static Future<DocumentReference> saveTalk(Talk talk) async {
    var documentReference = collectionReference.add(talk.toJson());
    updateConferenceDetails();

    return documentReference;
  }

  static deleteTalk(Talk talk) async {
    talk.id.delete();
    updateConferenceDetails();
  }

  static Talk createTalkFromSnapshot(DocumentSnapshot data) {
    var talk = Talk(
        data["title"],
        data["room"],
        TimeOfDay(hour: data["hour"], minute: data["min"]),
        DateTime(data["year"], data["month"], data["day"]),
        data["details"],
        data["imagePath"]);
    talk.setId(data.reference);
    return talk;
  }

  static addTalksToDatabase() async {
    var talks = [
      Talk(
          "Sessão de abertura",
          "Anfiteatro",
          TimeOfDay(hour: 14, minute: 30),
          DateTime(2020, 12, 16),
          "Abertura da sessão de palestras",
          'assets/images/arashiyama.jpg'),
      Talk(
          "Talk: Cérebro",
          "Anfiteatro",
          TimeOfDay(hour: 15, minute: 40),
          DateTime(2020, 12, 16),
          "Esta apresentação destaca alguns projetos e momentos de uma investigação transdisciplinar, que incorpora neurociências, neurotecnologia e arte, no contexto do percurso de doutoramento em Medias Digitais, especialização Criação de Audiovisual e de Conteúdos Interativos. As representações multimédia em tempo-real, interativas, geradas e controladas pelo uso direto dos potenciais elétricos do cérebro, com base em processos reativos e ativos, emoções e volição, via interfaces cérebro-computador, são centrais nos seus projetos.",
          'assets/images/bg1.jpg'),
      Talk(
          "Talk: Understanding",
          "Anfiteatro",
          TimeOfDay(hour: 16, minute: 30),
          DateTime(2020, 12, 16),
          "Knowledge exchange across domains is fraught with challenges. This talk will explore example use cases and success stories of cross-disciplinary collaboration from our 7000+ global community of engineers, musicians, developers, makers, creators and innovators, and explore tools and methodologies which facilitate collaboration across domains. The presentation introduces the EU OntoCommons project for cross-domain industrial interoperability via ontology-driven data documentation for an Industry Commons.",
          'assets/images/bg2.jpg'),
      Talk(
          "Talk: NLP",
          "Anfiteatro",
          TimeOfDay(hour: 17, minute: 20),
          DateTime(2020, 12, 16),
          "AI e interação humano-computador são áreas de pesquisa que têm sido o foco de muitas pesquisas nas últimas duas décadas. Embora as máquinas nunca precisem de todas as habilidades emocionais de que as pessoas precisam, alguns agentes artificiais precisam de alguma compreensão das emoções para que pareçam inteligentes ao interagir com os humanos. Esta palestra irá cobrir Modelos Computacionais de Emoção e como NLP (Natural Language Processing) pode ser usado como um estímulo para esses modelos. Irá expandir o tópico das emoções, abordar os modelos de última geração que tentam imitar as emoções e como a NLP pode ser usada para estimular esses modelos e influenciar decisões.",
          'assets/images/bg3.jpg'),
      Talk(
          "Cofee Break",
          "Lounge",
          TimeOfDay(hour: 19, minute: 00),
          DateTime(2020, 12, 16),
          "Pausa para tomar a oportunidade de falar com os palestrantes num ambiente relaxado",
          'assets/images/fuji.jpg'),
      Talk(
          "Workshop: Elixir",
          "B207",
          TimeOfDay(hour: 14, minute: 30),
          DateTime(2020, 12, 16),
          "Elixir is a functional language that inherits the power of Erlang and its benefits with an enjoyable and friendly syntax. Elixir is designed for building fault tolerant and scalable systems. The workshop will cover the basics around the language and will touch the actor model paradigm.",
          'assets/images/kiyomizu-dera.jpg'),
      Talk(
          "Pitch",
          "B208",
          TimeOfDay(hour: 18, minute: 10),
          DateTime(2020, 12, 16),
          "Durante o Pitch de Oportunidades, várias empresas farão um pequeno pitch promocional e, ainda que num contexto remoto, são promovidos momentos de networking com as empresas presentes. Interessado numa empresa e gostavas de saber mais? Gostavas de conhecer melhor o panorama empresarial da área? O Pitch de Oportunidades é o momento ideal para isso!",
          'assets/images/arashiyama.jpg'),
      Talk(
          "Talk: Passado",
          "Anfiteatro",
          TimeOfDay(hour: 14, minute: 30),
          DateTime(2020, 12, 17),
          "In this talk, I'm going to make public the letter that I would write to my past self. I wish I could read this letter when I was a recent-grad and warn me about the ups and downs that I faced in my career in software engineering.",
          'assets/images/bg1.jpg'),
      Talk(
          "Talk: World",
          "Anfiteatro",
          TimeOfDay(hour: 15, minute: 20),
          DateTime(2020, 12, 17),
          "A FEUP proporciona aos estudantes projetos de natureza bastante diversa, tanto do ponto de vista tecnológico como das skills exigidas. Contudo, já alguma vez te perguntaste o quão diferente é trabalhar no mundo real onde os projetos têm um verdadeiro impacto no mundo? Nesta talk vamos abordar algumas das principais diferenças entre o trabalho académico e o trabalho 'profissional', incluindo algumas dicas para te poderes preparar para fazer essa transição.",
          'assets/images/bg2.jpg'),
      Talk(
          "Workshop: Plataformas",
          "B209",
          TimeOfDay(hour: 14, minute: 30),
          DateTime(2020, 12, 17),
          "Learn how to build a native desktop app for Windows, Mac or Linux using JavaScript/HTML/CSS (Node.js, React.js and Electron.js). Making native desktop app development faster and easier with technologies you already know.",
          'assets/images/bg3.jpg'),
      Talk(
          "Sessão Entrevistas",
          "B208",
          TimeOfDay(hour: 15, minute: 00),
          DateTime(2020, 12, 17),
          "A Sessão de Entrevistas será um momento de contacto com direto entre os estudantes e as empresas. Seguindo um formato de 'mock interview', terás a hipótese de experienciar em primeira mão como é ser entrevistado para aquela empresa, servindo também como um momento de networking com um representante da empresa! Cada empresa terá a sua própria entrevista, pelo que a inscrição nas entrevistas de cada empresa é individual. Para te inscreveres numa sessão, clica na empresa respetiva!",
          'assets/images/fuji.jpg'),
      Talk(
          "Painel: Estágio",
          "Anfiteatro",
          TimeOfDay(hour: 16, minute: 10),
          DateTime(2020, 12, 17),
          "Com o objetivo de desmistificar a realização de estágios internacionais, convidamos diversos ex-alunos do MIEIC a partilhar a sua experiência e responder a qualquer questão que um estudante possa ter sobre o processo. Irão ser discutidos vários aspetos do processo: desde o processo de candidaturas, às experiências em si, atravessando os desafios que se opuseram, o lidar com pessoas de todo o mundo e uma comparação a um estágio a nível nacional.",
          'assets/images/kiyomizu-dera.jpg'),
      Talk(
          "Palestra: CERN",
          "Anfiteatro",
          TimeOfDay(hour: 14, minute: 30),
          DateTime(2020, 12, 18),
          "O CERN é a Organização Europeia para a Pesquisa Nuclear, o maior laboratório de física de partículas do mundo. Aqui está instalado o Large Hadron Collider (LHC), um acelerador de partículas com 27km de circunferência onde protões colidem mil milhões de vezes por segundo resultando em mais de 70PB de dados por ano. Esta sessão descreve a cloud privada do CERN, uma infra-estrutura com mais de 300.000 cores usada para processar e analisar todos estes dados. Detalhes da transição das mainframes do passado para os sistemas distribuídos actuais baseados em projectos open source como OpenStack e Kubernetes, entre muitos outros.",
          'assets/images/arashiyama.jpg'),
      Talk(
          "Palestra: Lua",
          "Anfiteatro",
          TimeOfDay(hour: 15, minute: 20),
          DateTime(2020, 12, 18),
          "Linguagens de programação são as ferramentas mais ubíquas no desenvolvimento de software. Desenvolvedores virtualmente habitam 'mundos virtuais' criados pelas linguagens que eles usam. Como com qualquer outro artefato, o projeto de uma linguagem de programação envolve inúmeros critérios conflitantes, como consisão versus legibilidade, abstração versus eficiência, segurança versus flexibilidade, etc. Lua é uma linguagem de programação desenvolvida na PUC-Rio que se tornou uma linguagem de script lider no mundo de videojogos. Lua também é usada extensivamente em sistemas embarcados e muitas outras aplicações, como o Adobe Lightroom e a Wikipédia. Ao longo dos anos, o projeto de Lua manteve simplicidade e pequeno tamanho como seus principais critérios de qualidade, dentro das restrições impostas por uma linguagem com uma ampla base de usuários. Nessa palestra pretendo discutir algumas das escolhas e decisões envolvidas ao longo da evolução de Lua, dentro do espaço de projetos de linguagens de programação.",
          'assets/images/bg1.jpg'),
      Talk(
          "Palestra: Game",
          "Anfiteatro",
          TimeOfDay(hour: 16, minute: 10),
          DateTime(2020, 12, 18),
          "Starting game development and building that first game is always exciting, but what can we expect? In this talk we'll talk about that first indie game I developed and had a bit of unrealistic expectations for a first project due to lack of experience an knowledge of how things actually worked.",
          'assets/images/bg2.jpg'),
      Talk(
          "Palestra: Hacking",
          "Anfiteatro",
          TimeOfDay(hour: 17, minute: 0),
          DateTime(2020, 12, 18),
          "IoT devices are spread other the world, and are using RF communication most of the time. This talk will be a practical introduction of assessing/attacking such devices over-the-air, and also talk about limitations that could be overcome by mixing various hardware attacks.",
          'assets/images/bg3.jpg'),
      Talk(
          "Encerramento",
          "Anfiteatro",
          TimeOfDay(hour: 17, minute: 50),
          DateTime(2020, 12, 18),
          "Sessão de Encerramento da conferência",
          'assets/images/fuji.jpg'),
      Talk(
          "WorkShop: ReactJS",
          "B209",
          TimeOfDay(hour: 13, minute: 15),
          DateTime(2020, 12, 18),
          "Don't you hate it when you accidentally click a button you didn't want to, and then your grandma receives an unwanted e-mail? You'd wish for the website to have an Undo button to go back in time, or at least make it seem like it. If you want to know how you could achieve that in a React application, you're in luck!... As long as you register in this workshop. You will learn how to handle timers, and leverage the Context API and hooks in React to provide all your components with an undoable-action creator, which they can use as needed. It will start as an introductory tech-talk about the main feature, to make you confortable with the code, and then we will explore different extra features which you can try to implement, with the instructor's help, for a more practical section. Although some context is given, this workshop is geared towards people with at least some basic knowledge of React.",
          'assets/images/bg1.jpg'),
      Talk(
          "Previous Talk",
          "B209",
          TimeOfDay(hour: 8, minute: 00),
          DateTime(2020, 12, 10),
          "Lorem Ipsum",
          'assets/images/kiyomizu-dera.jpg'),
    ];

    talks.forEach((element) {
      saveTalk(element);
    });

    conferenceRef.update({
      'days': 6,
      'talks': 19,
    });
  }

  static removeTalksFromDatabase() async {
    collectionReference.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
    conferenceRef.update({
      'days': 0,
      'talks': 0,
    });
  }

  static updateConferenceDetails() async {
    await collectionReference.get().then((querySnapshot) {
      Set<DateTime> days = Set();
      querySnapshot.docs.forEach((element) {
        days.add(DateTime(
          element.data()["year"],
          element.data()["month"],
          element.data()["day"],
        ));
      });
      conferenceRef.update({"days": days.length});
    });

    await collectionReference.get().then((value) {
      int talks = 0;
      value.docs.forEach((element) {
        talks++;
      });
      conferenceRef.update({"talks": talks});
    });
  }

  static editTalk(Talk talk) {
    var json = talk.toJson();
    talk.id.update(json);
    updateConferenceDetails();
  }
}
