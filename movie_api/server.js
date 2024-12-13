const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());
app.use(cors());

// Подключение к MongoDB
mongoose.connect('mongodb://localhost:27017/movieDB', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.log('Error connecting to MongoDB: ', err));

  const movieSchema = new mongoose.Schema({
    title: { type: String, required: [true, 'Title is required'] },
    description: { type: String, required: [true, 'Description is required'] },
    genre: { type: String, required: [true, 'Genre is required'] },
    year: { type: Number, required: [true, 'Year is required'], min: [1900, 'Invalid year'], max: [new Date().getFullYear(), 'Year cannot be in the future'] },
    rating: { type: Number, required: [true, 'Rating is required'], min: [0, 'Rating cannot be below 0'], max: [10, 'Rating cannot be above 10'] },
    poster_url: { type: String, required: [true, 'Poster URL is required'] },
    video_url: { type: String, required: [true, 'Video URL is required'] }
  });  
  
  const Movie = mongoose.model('Movie', movieSchema);
  

// Получить все фильмы
app.get('/movies', async (req, res) => {
    try {
      const movies = await Movie.find();
      res.json(movies);
    } catch (err) {
      res.status(500).send({ error: 'Error fetching movies' });
    }
  });
  
// Получить фильм по ID
app.get('/movies/:id', async (req, res) => {
    try {
      const movie = await Movie.findById(req.params.id);
      if (!movie) {
        return res.status(404).send({ error: 'Movie not found' });
      }
      res.json(movie);
    } catch (err) {
      res.status(500).send({ error: 'Error fetching movie' });
    }
  });
  

// Добавить новый фильм
app.post('/movies', async (req, res) => {
    const { title, description, genre, year, rating, poster_url, video_url } = req.body;
  
    if (!title || !description || !genre || !year || !rating || !poster_url || !video_url) {
      return res.status(400).send({ error: 'All fields are required' });
    }
  
    const newMovie = new Movie({
      title,
      description,
      genre,
      year,
      rating,
      poster_url,
      video_url
    });
  
    try {
      await newMovie.save();
      res.status(201).json(newMovie);
    } catch (err) {
      res.status(500).send({ error: 'Error adding movie' });
    }
  });
  

// Удалить фильм
app.delete('/movies/:id', async (req, res) => {
    try {
      const movie = await Movie.findByIdAndDelete(req.params.id);
      if (!movie) {
        return res.status(404).send({ error: 'Movie not found' });
      }
      res.json(movie);
    } catch (err) {
      res.status(500).send({ error: 'Error deleting movie' });
    }
  });
  

// Сервировать плейлисты и сегменты (опционально, если нужно будет)
app.get('/stream/:filename', (req, res) => {
    const filename = req.params.filename;
    const filePath = path.join(__dirname, 'hls', filename);  // Обратите внимание, что 'hls' должен быть существующей директорией
  
    res.sendFile(filePath, (err) => {
      if (err) {
        console.error('Ошибка при отправке файла:', err);
        res.status(404).send({ error: 'File not found' });
      }
    });
  });
  

// Запуск сервера
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
