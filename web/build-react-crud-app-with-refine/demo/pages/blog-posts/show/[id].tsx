import { GetServerSideProps } from "next";
import { serverSideTranslations } from "next-i18next/serverSideTranslations";

import { getServerSession } from "next-auth";
import { authOptions } from "../../api/auth/[...nextauth]";
import { useShow, useTranslate } from "@refinedev/core";
import { DateField, MarkdownField, NumberField, Show,TextFieldComponent as TextField, } from "@refinedev/mui";
import { Stack, Typography } from "@mui/material";

export default function BlogPostShow() {
  const translate = useTranslate();
  const { queryResult } = useShow();
  const { data, isLoading } = queryResult;

  const post = data?.data;

  return (
    <Show isLoading={isLoading}>
      <Stack gap={1}>
        <Typography variant="body1" fontWeight="bold">
          {translate("blog_posts.fields.id")}
        </Typography>
        <NumberField value={post?.id ?? ""} />
        <Typography variant="body1" fontWeight="bold">
          {translate("blog_posts.fields.title")}
        </Typography>
        <TextField value={post?.title} />
        <Typography variant="body1" fontWeight="bold">
          {translate("blog_posts.fields.content")}
        </Typography>
        <MarkdownField value={post?.content} />
        <TextField value={post?.status} />
        <Typography variant="body1" fontWeight="bold">
          {translate("blog_posts.fields.createdAt")}
        </Typography>
        <DateField value={post?.createdAt} />
      </Stack>
    </Show>
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
