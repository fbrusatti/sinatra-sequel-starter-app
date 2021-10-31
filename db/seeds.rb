# Clean data
User.all.map {|user| user.destroy }
Response.all.map { |response| response.destroy }
Outcome.all.map { |outcome| outcome.destroy }
Survey.all.map { |survey| survey.destroy }
Career.all.map { |career| career.destroy }
Choice.all.map { |choice| choice.destroy }
Question.all.map { |question| question.destroy }

# Questions
farmer = Question.create(
    name: 'Me trasladaría a una zona agrícola - ganadera para ejercer mi profesión.',
    description: 'Con relacion a Agronomia, Veterinaria'
)
math = Question.create(
    name: 'Tengo buena memoria y no me cuesta estudiar y retener fórmulas y palabras técnicas.',
    description: 'Con relacion a Física, Matemáticas, Química, Computación'
)
write = Question.create(
    name: 'Me gusta escribir. En general mis trabajos son largos y están bien organizados.',
    description: 'Con relacion a Literatura, Historia'
)
physics = Question.create(
    name: 'Sé quien es Steven Hawking: Conozco y me atraen sus descubrimientos.',
    description: 'Con relacion a Física'
)
informatic = Question.create(
    name: 'Me actualizo respecto de los avances tecnológicos y me intereso por investigar y conocer',
    description: 'Con relacion a Computación'
)
art = Question.create(
    name: 'Sé quien es Andy Warhol y a qué movimiento artístico pertenece. Me apasiona conocer acerca del arte y sus exponentes.',
    description: 'Con relacion a Arte'
)
history = Question.create(
    name: 'En general me intereso por las dificultades que ha tenido que atravesar la humanidad y cómo lo ha superado.',
    description: 'Con relacion a Historia'
)
history_and_literature = Question.create(
    name: 'Me apasiona leer y no me importa si el libro que elijo tiene muchas páginas, para mí es un gran entretenimiento.',
    description: 'Con relacion a Literatura, Historia'
)
economy = Question.create(
    name: 'Me atrae conocer los procesos y las áreas que hacen funcionar a las empresas.',
    description: 'Con relacion a Economia'
)
history_and_philosophy = Question.create(
    name: 'Me siento identificado con el pensamiento de algunos filósofos y escritores.',
    description: 'Con relacion a Filosofia, Historia'
)
medicine = Question.create(
    name: 'Me encanta estudiar el cuerpo humano y conocer cómo funciona. Además, no me impresiona la sangre.',
    description: 'Con relacion a Medicina'
)
informatic_and_arquitecture = Question.create(
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
farmer_choice = Choice.create(
    text: 'Si',
    question_id: farmer.id
)
math_choice = Choice.create(
    text: 'Si',
    question_id: math.id
)
write_choice = Choice.create(
    text: 'Si',
    question_id: write.id
)
physics_choice = Choice.create(
    text: 'Si',
    question_id: physics.id
)
informatic_choice = Choice.create(
    text: 'Si',
    question_id: informatic.id
)
art_choice = Choice.create(
    text: 'Si',
    question_id: art.id
)
history_choice = Choice.create(
    text: 'Si',
    question_id: history.id
)
history_and_literature_choice = Choice.create(
    text: 'Si',
    question_id: history_and_literature.id
)
economy_choice = Choice.create(
    text: 'Si',
    question_id: economy.id
)
history_and_philosophy_choice = Choice.create(
    text: 'Si',
    question_id: history_and_philosophy.id
)
medicine_choice = Choice.create(
    text: 'Si',
    question_id: medicine.id
)
informatic_and_arquitecture_choice = Choice.create(
    text: 'Si',
    question_id: informatic_and_arquitecture.id
)
blog_choice_1 = Choice.create(
    text: 'La importancia de la expresión artística en el desarrollo de la identidad de los pueblos.',
    question_id: blog.id
)
blog_choice_2 = Choice.create(
    text: 'La arquelogía urbana como forma de aprender acerca de la historia cultural de una ciudad.',
    question_id: blog.id
)
blog_choice_3 = Choice.create(
    text: 'La tecnología satelital en un proyecto para descubrir actividad volcánica para prevenir catástrofes climáticas.',
    question_id: blog.id
)

group_choice_1 = Choice.create(
    text: 'La práctica de deportes y su influencia positiva en el estado de ánimo de las personas.',
    question_id: group.id
)
group_choice_2 = Choice.create(
    text: 'Los pensadores del siglo XX y su aporte a la gestión de las organizaciones.',
    question_id: group.id
)
group_choice_3 = Choice.create(
    text: 'Las mascotas y su incidencia en la calidad de vida de las personas no videntes.',
    question_id: group.id
)
group_choice_4 = Choice.create(
    text: 'El uso de la PC como herramienta para el control de los procesos industriales.',
    question_id: group.id
)
group_choice_5 = Choice.create(
    text: 'Procesos productivos de una empresa',
    question_id: group.id
)

priority_choice_1 = Choice.create(
    text: 'Director de una investigación técnico científica.',
    question_id: priority.id
)
priority_choice_2 = Choice.create(
    text: 'Gerente general de una empresa reconocida por su responsabilidad social.',
    question_id: priority.id
)
priority_choice_3 = Choice.create(
    text: 'Un deportista famoso por su destreza física y su ética profesional.',
    question_id: priority.id
)
priority_choice_4 = Choice.create(
    text: 'Un agente de prensa audaz, número uno en el ranking de notas a celebridades.',
    question_id: priority.id
)
priority_choice_5 = Choice.create(
    text: 'Experto en la detección precoz de enfermedades neurológicas en niños.',
    question_id: priority.id
)

# Careers
arquitecture_career = Career.create(name: 'Arquitectura', link: '')
art_career = Career.create(name: 'Arte', link: '')
informatic_career = Career.create(name: 'Computación', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig2.php?n=QiZi9hLT57Fip/rkJOHhJZaaCYsBAPETixEYkBrhlAI=')
economy_career = Career.create(name: 'Economía', link: 'https://www.eco.unrc.edu.ar/seccion/grado/plan-estudios-le/')
gym_career = Career.create(name: 'Educación Fisica', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig5.php?n=EnmIjqbc0Uta5lIlTsxBKRbylQg2dQAA3XYHBM6chLE%3D')
philosophy_career = Career.create(name: 'Filosofía', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig5.php?n=jJ3xRJeQsn2Iok1HQpVZHRiddh1Ede0JgFuD1shHXRc%3D')
physics_career = Career.create(name: 'Física', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig2.php?n=tQPxQVYkZmwPj2Sl%2BtQyhVuUVwBge%2Fjjs%2F5a3WgGbeQ%3D')
geology_career = Career.create(name: 'Geología', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig2.php?n=pRWKdi%2Fd%2FJl4mRrgaWAxd2A96dUddFPYakaXqOo0PYU%3D')
history_career = Career.create(name: 'Historia', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig5.php?n=rV8U7R3EWnVoZI79l5WWgcNKLdq3hYSQuzMdkxUSlWE%3D')
literature_career = Career.create(name: 'Literaruta', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig5.php?n=%2FBpLfBDYxXmQaxDePIM%2Bvqvf5cLyAysalAWtwPjvud4%3D')
math_career = Career.create(name: 'Matemáticas', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig2.php?n=UC55Mug%2BT2YolRq1o%2F1ssRc3ocBCtzvFfjJku4bkUVE%3D')
medicine_career = Career.create(name: 'Medicina', link: '')
sociology_career = Career.create(name: 'Sociología', link: '')
periodism_career = Career.create(name: 'Periodismo', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig5.php?n=nm%2BbeKeSWYL8zSYqQxDEk7H7SUVig99bhQOHGJSkTMU%3D')
chimesrty_career = Career.create(name: 'Química', link: 'https://www.unrc.edu.ar/unrc/carreras/ProgAsig2.php?n=jHkVW45CPW5kIWNIkiemrHnaI9ydncBO36GTxfGawAU%3D')
agronomy_career = Career.create(name: 'Agronomia', link: 'http://www.ayv.unrc.edu.ar/index.php/es/carreras/carreras-de-grado/ingeniaria-agronomica')
veterinary_career = Career.create(name: 'Veterinaria', link: 'http://www.ayv.unrc.edu.ar/index.php/es/carreras/carreras-de-grado/medicina-veterinaria')

# Surveys
Survey.create(username: 'Franco', career_id: veterinary_career.id)
Survey.create(username: 'Gonza', career_id: agronomy_career.id)
Survey.create(username: 'Mati', career_id: chimesrty_career.id)

# Outcomes
Outcome.create(career_id: veterinary_career.id, choice_id: farmer_choice.id)
Outcome.create(career_id: agronomy_career.id, choice_id: farmer_choice.id)

Outcome.create(career_id: chimesrty_career.id, choice_id: math_choice.id)
Outcome.create(career_id: physics_career.id, choice_id: math_choice.id)
Outcome.create(career_id: informatic_career.id, choice_id: math_choice.id)
Outcome.create(career_id: math_career.id, choice_id: math_choice.id)

Outcome.create(career_id: history_career.id, choice_id: write_choice.id)
Outcome.create(career_id: literature_career.id, choice_id: write_choice.id)

Outcome.create(career_id: physics_career.id, choice_id: physics_choice.id)

Outcome.create(career_id: informatic_career.id, choice_id: informatic_choice.id)

Outcome.create(career_id: art_career.id, choice_id: art_choice.id)

Outcome.create(career_id: history_career.id, choice_id: history_choice.id)

Outcome.create(career_id: history_career.id, choice_id: history_and_literature_choice.id)
Outcome.create(career_id: literature_career.id, choice_id: history_and_literature_choice.id)

Outcome.create(career_id: economy_career.id, choice_id: economy_choice.id)

Outcome.create(career_id: history_career.id, choice_id: history_and_philosophy_choice.id)
Outcome.create(career_id: philosophy_career.id, choice_id: history_and_philosophy_choice.id)

Outcome.create(career_id: medicine_career.id, choice_id: medicine_choice.id)

Outcome.create(career_id: arquitecture_career.id, choice_id: informatic_and_arquitecture_choice.id)
Outcome.create(career_id: informatic_career.id, choice_id: informatic_and_arquitecture_choice.id)

Outcome.create(career_id: sociology_career.id, choice_id: blog_choice_1.id)
Outcome.create(career_id: history_career.id, choice_id: blog_choice_2.id)
Outcome.create(career_id: informatic_career.id, choice_id: blog_choice_3.id)
Outcome.create(career_id: geology_career.id, choice_id: blog_choice_3.id)

Outcome.create(career_id: gym_career.id, choice_id: group_choice_1.id)
Outcome.create(career_id: history_career.id, choice_id: group_choice_2.id)
Outcome.create(career_id: philosophy_career.id, choice_id: group_choice_2.id)
Outcome.create(career_id: veterinary_career.id, choice_id: group_choice_3.id)
Outcome.create(career_id: informatic_career.id, choice_id: group_choice_4.id)
Outcome.create(career_id: economy_career.id, choice_id: group_choice_5.id)

Outcome.create(career_id: informatic_career.id, choice_id: priority_choice_1.id)
Outcome.create(career_id: chimesrty_career.id, choice_id: priority_choice_1.id)
Outcome.create(career_id: physics_career.id, choice_id: priority_choice_1.id)
Outcome.create(career_id: economy_career.id, choice_id: priority_choice_2.id)
Outcome.create(career_id: gym_career.id, choice_id: priority_choice_3.id)
Outcome.create(career_id: medicine_career.id, choice_id: priority_choice_4.id)
Outcome.create(career_id: periodism_career.id, choice_id: priority_choice_5.id)
