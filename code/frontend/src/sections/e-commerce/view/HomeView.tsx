import React, { useEffect, useState } from 'react';
import { Banner, BestSellingBooks, Category, LatestBooks } from '../home';
import fetch from 'src/services/axios';
import { getProduct } from 'src/redux/slice/productSlice';
import { useAppDispatch } from 'src/redux/store';
import { apiPaths } from 'src/services/api/path-api';
import { BookType } from 'src/types/book';

export default function HomeView() {
  // const dispatch = useAppDispatch();
  // useEffect(() => {
  //   dispatch(getProduct());
  //   // fetch.get(apiPaths.products).then((res) => console.log(res.data));
  // }, [dispatch]);

  const [books, setBooks] = useState<Array<BookType>>([]);

  const [bookss, setBookss] = useState<Array<BookType>>([]);

  useEffect(() => {
    fetch(apiPaths.book)
      .then((res) => {
        setBooks(res.data);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  useEffect(() => {
    fetch.get('/api/details/2')
      .then((res) => {
        setBookss(res.data);

      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  console.log(bookss)
  return (
    <>
      <Banner />

      <Category />

      <BestSellingBooks books={books} />

      <LatestBooks books={books} />
    </>
  );
}
