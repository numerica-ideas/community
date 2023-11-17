import { GetServerSideProps } from "next";
import { serverSideTranslations } from "next-i18next/serverSideTranslations";

import { getServerSession } from "next-auth";
import { authOptions } from "../api/auth/[...nextauth]";
import {
  Box,
  Button,
  CircularProgress,
  Grid,
  Pagination,
} from "@mui/material";
import PostCard from "@components/post-card";
import { useList } from "@refinedev/core";
import { useEffect, useState } from "react";
import AddIcon from '@mui/icons-material/Add';
import Link from "next/link";

export default function BlogPostList() {
  const [posts, setPost] = useState<any[]>([]);
  const [page, setPage] = useState(1);
  const { data, isLoading } = useList({
    resource: "posts",
    pagination: { current: page },
  });

  useEffect(() => {
    setPost(data?.data ?? []);
  });

  if (isLoading) {
    return <div>Loading...</div>;
  }

  return (
    <>
    <Box sx={{display:"flex", justifyContent:"flex-end",marginBottom:3}}>
    <Button variant="contained" startIcon={<AddIcon/>}>
      <Link href="blog-posts/create" style={{color:"unset", textDecoration:"unset"}}>Create Post</Link>
      </Button>
    </Box>

      <Grid container sx={{minHeight:900}} spacing={2} style={{ position: "relative" }}>
        {posts.map((post, i) => (
          <Grid item lg={3}>
            <PostCard post={post} key={i} />
          </Grid>
        ))}
        {isLoading && (
          <Box
            style={{
              position: "absolute",
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              backgroundColor: "#0000008f",
            }}
          >
            <Box sx={{ display: "flex" }}>
              <CircularProgress />
            </Box>
          </Box>
        )}
      </Grid>
      <Pagination
        onChange={(e, v) => setPage(v)}
        style={{
          display: "flex",
          justifyContent: "flex-end",
          marginTop: "20px",
        }}
        count={data?.total}
        showFirstButton
        showLastButton
      />
    </>
  );
}

export const getServerSideProps: GetServerSideProps<{}> = async (context) => {
  const session = await getServerSession(context.req, context.res, authOptions);

  const translateProps = await serverSideTranslations(context.locale ?? "en", [
    "common",
  ]);

  if (!session) {
    return {
      props: {
        ...translateProps,
      },
      redirect: {
        destination: `/login?to=${encodeURIComponent("/blog-posts")}`,
        permanent: false,
      },
    };
  }

  return {
    props: {
      ...translateProps,
    },
  };
};
