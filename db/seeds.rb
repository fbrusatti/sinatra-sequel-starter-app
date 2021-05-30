# Questions
Choice.all.map { |choice| choice.destroy }

Question.all.map { |question| question.destroy }

Question.create(
    name: 'Me trasladaría a una zona agrícola - ganadera para ejercer mi profesión.',
    description: 'Con relacion a Agronomia, Veterinaria'
)
Question.create(
    name: 'Tengo buena memoria y no me cuesta estudiar y retener fórmulas y palabras técnicas.',
    description: 'Con relacion a Física, Matemáticas, Química, Computación'
)
Question.create(
    name: 'Me gusta escribir. En general mis trabajos son largos y están bien organizados.',
    description: 'Con relacion a Literaruta, Historia'
)
Question.create(
    name: 'Sé quien es Steven Hawking: Conozco y me atraen sus descubrimientos.',
    description: 'Con relacion a Física'
)
Question.create(
    name: 'Me actualizo respecto de los avances tecnológicos y me intereso por investigar y conocer',
    description: 'Con relacion a Computación'
)
Question.create(
    name: 'Sé quien es Andy Warhol y a qué movimiento artístico pertenece. Me apasiona conocer acerca del arte y sus exponentes.',
    description: 'Con relacion a Arte'
)
Question.create(
    name: 'En general me intereso por las dificultades que ha tenido que atravesar la humanidad y cómo lo ha superado.',
    description: 'Con relacion a Historia'
)
Question.create(
    name: 'Me apasiona leer y no me importa si el libro que elijo tiene muchas páginas, para mí es un gran entretenimiento.',
    description: 'Con relacion a Literatura, Historia'
)
Question.create(
    name: 'Me atrae conocer los procesos y las áreas que hacen funcionar a las empresas.',
    description: 'Con relacion a Economia'
)
Question.create(
    name: 'Me siento identificado con el pensamiento de algunos filósofos y escritores.',
    description: 'Con relacion a Filosofia, Historia'
)
Question.create(
    name: 'Me encanta estudiar el cuerpo humano y conocer cómo funciona. Además, no me impresiona la sangre.',
    description: 'Con relacion a Medicina'
)
Question.create(
    name: 'Si pudiera elegir, pasaría mucho tiempo diseñando novedosos objetos o edificios en mi computadora.',
    description: 'Con relacion a Medicina'
)

blog = Question.create(
    name: 'Si mi blog fuera temático, trataría acerca de:',
    description: 'Con relacion a Computacion, Arquitectura'
)

group = Question.create(
    name: 'Integraría un equipo de trabajo encargado de producir un audiovisual sobre:',
    description: 'Con relacion a Sociología, Historia, Computacion, Geologia',
)

priority = Question.create(
    name: 'Sería importante destacarme como:',
    description: 'Con relacion a Educacion Fisica, Veterinaria, Computacion, Economia, Historia, Filosofia'
)

# Choices

Choice.all.map { |choice| choice.destroy }

Choice.create(
    text: 'La importancia de la expresión artística en el desarrollo de la identidad de los pueblos.',
    question_id: blog.id
)
Choice.create(
    text: 'La arquelogía urbana como forma de aprender acerca de la historia cultural de una ciudad.',
    question_id: blog.id
)
Choice.create(
    text: 'La tecnología satelital en un proyecto para descubrir actividad volcánica para prevenir catástrofes climáticas.',
    question_id: blog.id
)

Choice.create(
    text: 'La práctica de deportes y su influencia positiva en el estado de ánimo de las personas.',
    question_id: group.id
)
Choice.create(
    text: 'Los pensadores del siglo XX y su aporte a la gestión de las organizaciones.',
    question_id: group.id
)
Choice.create(
    text: 'Las mascotas y su incidencia en la calidad de vida de las personas no videntes.',
    question_id: group.id
)
Choice.create(
    text: 'El uso de la PC como herramienta para el control de los procesos industriales.',
    question_id: group.id
)
Choice.create(
    text: 'Procesos productivos de una empresa',
    question_id: group.id
)

Choice.create(
    text: 'Director de una investigación técnico científica.',
    question_id: priority.id
)
Choice.create(
    text: 'Gerente general de una empresa reconocida por su responsabilidad social.',
    question_id: priority.id
)
Choice.create(
    text: 'Un deportista famoso por su destreza física y su ética profesional.',
    question_id: priority.id
)
Choice.create(
    text: 'Un agente de prensa audaz, número uno en el ranking de notas a celebridades.',
    question_id: priority.id
)
Choice.create(
    text: 'Experto en la detección precoz de enfermedades neurológicas en niños.',
    question_id: priority.id
)

# Careers

Career.all.map { |career| career.destroy }

Career.create(name: 'Arquitectura')
Career.create(name: 'Arte')
Career.create(name: 'Computación')
Career.create(name: 'Economía')
Career.create(name: 'Educación física')
Career.create(name: 'Filosofía')
Career.create(name: 'Física')
Career.create(name: 'Geología')
Career.create(name: 'Historia')
Career.create(name: 'Literaruta')
Career.create(name: 'Matemáticas')
Career.create(name: 'Medicina')
Career.create(name: 'Sociología')
Career.create(name: 'Periodismo')

quimica = Career.create(name: 'Química')
agronomia = Career.create(name: 'Agronomia')
veterinaria = Career.create(name: 'Veterinaria')

# Surveys

Survey.all.map { |survey| survey.destroy }

Survey.create(username: 'Franco', career_id: veterinaria.id)
Survey.create(username: 'Gonza', career_id: agronomia.id)
Survey.create(username: 'Mati', career_id: quimica.id)