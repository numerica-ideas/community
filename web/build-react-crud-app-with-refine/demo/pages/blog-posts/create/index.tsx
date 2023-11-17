import { GetServerSideProps } from "next";
import { serverSideTranslations } from "next-i18next/serverSideTranslations";

import { getServerSession } from "next-auth";
import { authOptions } from "../../api/auth/[...nextauth]";
import { Create } from "@refinedev/mui";
import { Box, Button, TextField } from "@mui/material";
import { useState } from "react";
import { useForm } from "@refinedev/core";

interface FormValues {
  id?: number;
  title: string;
  content: string;
}

export default function BlogPostCreate() {
  const { formLoading, onFinish, queryResult } = useForm();
  const defaultValues = queryResult?.data?.data;

  const [values, setValues] = useState<FormValues>({
    title: "",
    content: "",
  })

  const onChangeValue = (e: any) => {
    setValues({
      ...values,
      [e.target.name]: e.target.value,
    });
  }
  const handleSubmit = (e: any) => {
    e.preventDefault();
    onFinish(values);
  };
  return <Create isLoading={formLoading} footerButtons={<Button variant="outlined" disabled={formLoading} onClick={handleSubmit}>Save</Button>}>
    <Box
      component="form"
      noValidate
      autoComplete="off"
    >

      <TextField
        label="Title"
        name="title"
        required
        variant="outlined"
        color="primary"
        disabled={formLoading}
        type="text"
        sx={{ mb: 3 }}
        fullWidth
        onChange={onChangeValue}
        value={values.title}
      />
      <TextField
        label="Content"
        name="content"
        variant="outlined"
        color="primary"
        type="content"
        disabled={formLoading}
        fullWidth
        sx={{ mb: 3 }}
        onChange={onChangeValue}
        value={values.content}
      />
    </Box>
  </Create>
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
